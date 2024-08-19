import SwiftUI

import ComposableArchitecture

@Reducer
struct SignUpCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var focusedField: Field?
    var email = ""
    var password = ""
    var confirmPassword = ""
    var confirmPasswordError = ""
    var name = ""
    var isConfirmButtonDisabled = false
    
    enum Field: String, Hashable {
      case email
      case password
      case confirmPassword
      case name
    }
  }
  
  @Dependency(\.authenticationService) var authenticationService
  @Dependency(\.firestoreService) var firestoreService
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    
    case tapSignUpButton
    case tapExistAccountButton
    case didChangeConfirmPassword(String)
    case onSubmit(State.Field)
    case didChangeText
    
    case _requestSignUp
    case _signUpResponse(Result<Int, FMError>)
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    
    Reduce { state, action in
      switch action {
      case .binding: break
      case .tapSignUpButton: break
      case .tapExistAccountButton: break
      case let .didChangeConfirmPassword(text):
        state.confirmPasswordError = state.password == text ? "" : "입력한 비밀번호와 같게 입력해주세요"
        
      case let .onSubmit(field):
        switch field {
        case .email:
          state.focusedField = .password
          
        case .password:
          state.focusedField = .confirmPassword
          
        case .confirmPassword:
          state.focusedField = .name
          
        case .name: break
        }
        
      case .didChangeText:
        state.isConfirmButtonDisabled = state.email.isEmpty ||
        state.password.isEmpty ||
        state.confirmPassword.isEmpty ||
        state.name.isEmpty ||
        state.confirmPasswordError.isEmpty == false
        
      case ._requestSignUp:
        let entity = SignUpEntity(email: state.email, password: state.password, name: state.name)
        return .run { [state] send in
          guard let uid = try await authenticationService.signup(entity: entity) else {
            print("회원가입에 실패함")
            return
          }
          
          let userEntity = SignUpEntity(
            id: uid,
            email: state.email,
            password: state.password,
            name: state.name
          )
          try await firestoreService.save(target: .signup(userEntity))
          await send(._signUpResponse(.success(0)))
        } catch: { error, send in
          await send(._signUpResponse(.failure(error.toFMError)))
        }
        
      case ._signUpResponse(.success): break
      case let ._signUpResponse(.failure(error)): break
      }
      
      return .none
    }
  }
}

struct SignUpView: View {
  @Perception.Bindable private var store: StoreOf<SignUpCore>
  
  @FocusState private var focusedField: SignUpCore
    .State.Field?
  
  init(store: StoreOf<SignUpCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ZStack {
        Color.bg
          .ignoresSafeArea()
        
        VStack(spacing: 20) {
          TitleLabel
            .padding(.vertical, 40)
          
          EmailSection
          
          PasswordSection
          
          PasswordConfirmSection
          
          NameSection
          
          SignUpButton
            .padding(.top, 10)
          
          ExistAccountButton
          
          Spacer()
        }
        .padding(.horizontal, 20)
      }
      .bind($store.focusedField, to: $focusedField)
      .contentShape(Rectangle())
      .onTapGesture {
        endEditing()
      }
    }
  }
}

// MARK: - Component

private extension SignUpView {
  var TitleLabel: some View {
    Text("회원가입")
      .customFont(.notoSansKRSemiBold, size: 30)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var EmailSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이메일")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        placeholder: "예) test01@gmail.com",
        text: $store.email
      )
      .keyboardType(.emailAddress)
      .focused($focusedField, equals: .email)
      .onSubmit {
        store.send(.onSubmit(.name))
      }
    }
  }
  
  var PasswordSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        type: .secure,
        placeholder: "비밀번호 입력",
        text: $store.password
      )
      .focused($focusedField, equals: .password)
      .onSubmit {
        store.send(.onSubmit(.password))
      }
    }
  }
  
  var PasswordConfirmSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호 확인")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        type: .secure,
        placeholder: "비밀번호 다시 입력",
        text: $store.confirmPassword
      )
      .errorMessage(errorMessage: $store.confirmPasswordError)
      .focused($focusedField, equals: .confirmPassword)
      .onChange(of: store.confirmPassword) { value in
        store.send(.didChangeConfirmPassword(value))
      }
      .onSubmit {
        store.send(.onSubmit(.confirmPassword))
      }
    }
  }
  
  var NameSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이름")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        placeholder: "이름 입력",
        text: $store.name
      )
      .focused($focusedField, equals: .name)
    }
  }
  
  var SignUpButton: some View {
    FMButton(title: "회원가입") {
      store.send(.tapSignUpButton)
    }
    .disabled(store.isConfirmButtonDisabled)
  }
  
  var ExistAccountButton: some View {
    VStack(alignment: .center) {
      Button {
        store.send(.tapExistAccountButton)
      } label: {
        Text("이미 계정이 있나요?")
          .customFont(size: 16)
          .foregroundColor(.textPrimary1)
      }
    }
  }
}

#Preview {
  SignUpView(store: .init(initialState: SignUpCore.State()) {
    SignUpCore()
  })
}

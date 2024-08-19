import SwiftUI

import ComposableArchitecture

@Reducer
struct LoginCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var focusedField: Field?
    var email = ""
    var password = ""
    var isLoginErrorPresented = false
    var isLoading = false
    var loginError: String?
    var isConfirmButtonDisabled = true
    
    enum Field: String, Hashable {
      case email
      case password
    }
  }
  
  @Dependency(\.authenticationService) var authenticationService
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    case delegate(Delegate)
    
    case didChangeEmail(String)
    case didChangePassword(String)
    case onSubmit(State.Field)
    
    case _setIsLoginErrorPresented(Bool)
    case _setConfirmButtonState
    case _requestLogin
    case _loginResponse(Result<Int, FMError>)
    
    enum Delegate {
      case home
      case signUp
    }
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    
    Reduce { state, action in
      switch action {
      case .binding: break
      case .delegate: break
      case let .didChangeEmail(value):
        state.email = value
        return .send(._setConfirmButtonState)
                
      case let .didChangePassword(value):
        state.password = value
        return .send(._setConfirmButtonState)
        
      case let .onSubmit(field):
        if field == .email {
          state.focusedField = .password
        }
        
      case let ._setIsLoginErrorPresented(isPresented):
        state.isLoginErrorPresented = isPresented
        
      case ._setConfirmButtonState:
        state.isConfirmButtonDisabled = state.email.isEmpty || state.password.isEmpty
        
      case ._requestLogin:
        state.isLoading = true
        return .run { [state] send in
          try await authenticationService.login(entity: .init(email: state.email, password: state.password))
          await send(._loginResponse(.success(0)))
        } catch: { error, send in
          await send(._loginResponse(.failure(error.toFMError)))
        }
        
      case ._loginResponse(.success):
        state.loginError = nil
        state.isLoading = false
        
      case let ._loginResponse(.failure(error)):
        state.isLoading = false
        state.isLoginErrorPresented = true
        switch error {
        case let .login(reason):
          state.loginError = reason.message
          
        default:
          state.loginError = "로그인에 실패했습니다.\n다시 시도해주세요."
        }
      }
      
      return .none
    }
  }
}

struct LoginView: View {
  @Perception.Bindable private var store: StoreOf<LoginCore>
  
  @FocusState private var focusField: LoginCore
    .State.Field?
  
  init(store: StoreOf<LoginCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ZStack {
        Color.bg
          .ignoresSafeArea()
        
        VStack(spacing: 20) {
          TitleLabel
            .padding(.top, 40)
            .padding(.bottom, 20)
          
          EmailView
          
          PasswordView
            .padding(.bottom, 20)
          
          LoginButton
          
          SignupButton
          
          Spacer()
        }
        .padding(.horizontal, 20)
        .contentShape(Rectangle())
        .onTapGesture {
          endEditing()
        }
      }
      .bind($store.focusedField, to: $focusField)
      .loadingView(isLoading: store.isLoading)
      .fmAlert(isPresented: $store.isLoginErrorPresented) {
        FMAlertContainer {
          FMDefaultAlert(message: store.loginError ?? "")
        }
        .addButton(type: .confirm, buttonStyle: .primary(title: "확인")) {
          store.send(._setIsLoginErrorPresented(false))
        }
      }
    }
  }
}

private extension LoginView {
  var TitleLabel: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("로그인")
        .customFont(.notoSansKRSemiBold, size: 30)

      Text("오늘은 나에게\n더 집중하는 시간을 가져보세요. 🙂")
        .customFont(size: 16)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var EmailView: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이메일")
        .customFont(.notoSansKRMedium, size: 20)
      FMTextField(placeholder: "이메일을 입력하세요", text: $store.email.sending(\.didChangeEmail))
        .keyboardType(.emailAddress)
        .focused($focusField, equals: .email)
        .onSubmit {
          store.send(.onSubmit(.email))
        }
    }
  }
  
  var PasswordView: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호")
        .customFont(.notoSansKRMedium, size: 20)
      FMTextField(
        type: .secure,
        placeholder: "비밀번호를 입력하세요",
        text: $store.password.sending(\.didChangePassword)
      )
      .focused($focusField, equals: .password)
    }
  }
  
  var LoginButton: some View {
    FMButton(title: "로그인") {
      endEditing()
      store.send(._requestLogin)
    }
    .disabled(store.isConfirmButtonDisabled)
  }
  
  var SignupButton: some View {
    Button {
      store.send(.delegate(.signUp))
    } label: {
      Text("회원가입 하러가기")
        .customFont(size: 16)
        .foregroundColor(.textPrimary1)
    }
  }
}

#Preview {
  LoginView(store: .init(initialState: LoginCore.State()) {
    LoginCore()
  })
}

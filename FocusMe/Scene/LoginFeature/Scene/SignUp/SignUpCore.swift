import Foundation

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
    var isLoading = false
    
    var signupError: String?
    var isSignupErrorPresented = false
    
    enum Field: String, Hashable {
      case email
      case password
      case confirmPassword
      case name
    }
  }
  
  @Dependency(\.authenticationService) var authenticationService
  
  private let signUpRepo = SignUpRepository()
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    case delegate(Delegate)
    
    case tapSignUpButton
    case tapExistAccountButton
    case didChangeConfirmPassword(String)
    case onSubmit(State.Field)
    case didChangeText
    
    case _requestSignUp
    case _signUpResponse(Result<Int, FMError>)
    case _setIsSignupErrorPresented(Bool)
    
    enum Delegate {
      case main
      case login
    }
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    
    Reduce { state, action in
      switch action {
      case .binding: break
      case .delegate: break
      case .tapSignUpButton:
        return .send(._requestSignUp)
        
      case .tapExistAccountButton:
        return .send(.delegate(.login))
        
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
        state.isLoading = true
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
          
          try await signUpRepo.signup(target: .signup(userEntity))
          await send(._signUpResponse(.success(0)))
        } catch: { error, send in
          await send(._signUpResponse(.failure(error.toFMError)))
        }
        
      case ._signUpResponse(.success):
        state.isLoading = false
        state.signupError = nil
        return .send(.delegate(.main))
        
      case let ._signUpResponse(.failure(error)):
        state.isLoading = false
        state.isSignupErrorPresented = true
        switch error {
        case let .signup(reason):
          state.signupError = reason.message
          
        default:
          state.signupError = "로그인에 실패했습니다.\n다시 시도해주세요."
        }
        
      case let ._setIsSignupErrorPresented(isPresented):
        state.isSignupErrorPresented = isPresented
      }
      
      return .none
    }
  }
}

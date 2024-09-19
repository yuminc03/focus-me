import Foundation

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
  
  private let loginRepo = LoginRepository()
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    case delegate(Delegate)
    
    case tapLoginButton
    case tapSignupButton
    case didChangeEmail(String)
    case didChangePassword(String)
    case onSubmit(State.Field)
    
    case _setIsLoginErrorPresented(Bool)
    case _setConfirmButtonState
    case _requestLogin
    case _loginResponse(Result<Int, FMError>)
    
    enum Delegate {
      case main
      case signup
    }
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    
    Reduce { state, action in
      switch action {
      case .binding: break
      case .delegate: break
      case .tapLoginButton:
        return .send(._requestLogin)
        
      case .tapSignupButton:
        return .send(.delegate(.signup))
        
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
          try await loginRepo.login(target: .getUserInfo(UserInfo.shared.uid ?? ""))
          await send(._loginResponse(.success(0)))
        } catch: { error, send in
          await send(._loginResponse(.failure(error.toFMError)))
        }
        
      case ._loginResponse(.success):
        state.loginError = nil
        state.isLoading = false
        return .send(.delegate(.main))
        
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

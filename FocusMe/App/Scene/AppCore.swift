import Foundation

import ComposableArchitecture

@Reducer
struct AppCore {
  @ObservableState
  struct State: Equatable {
    static let initialState = State(
      appState: .splash,
      main: .initialState,
      login: .initialState
    )
    
    var appState: AppState
    
    var main: MainTabCoordinator.State
    var login: LoginCoordinator.State
  }
  
  enum AppState {
    case splash
    case login
    case main
  }
  
  private let loginRepo = LoginRepository()
  
  enum Action {
    case main(MainTabCoordinator.Action)
    case login(LoginCoordinator.Action)
    
    case _getCurrentUser
    case _setAppState(AppState)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.main, action: \.main) {
      MainTabCoordinator()
    }
    Scope(state: \.login, action: \.login) {
      LoginCoordinator()
    }
    Reduce { state, action in
      switch action {
        // 로그인 화면에서 로그인 버튼 눌렀을 때
      case .login(.router(.routeAction(id: _, action: .login(.delegate(.main))))):
        state.appState = .main
        state.main = .initialState
        
        // 회원가입 화면에서 회원가입 버튼 눌렀을 때
      case .login(.router(.routeAction(id: _, action: .signup(.delegate(.main))))):
        state.appState = .main
        state.main = .initialState
        
      case ._getCurrentUser:
        if AuthenticationService.shared.getCurrentUser() {
          return .run { send in
            try await loginRepo.login(target: .getUserInfo(UserInfo.shared.uid ?? ""))
            await send(._setAppState(.main))
          } catch: { error, send in
            await send(._setAppState(.login))
          }
        } else {
          return .send(._setAppState(.login))
        }
        
      case let ._setAppState(appState):
        switch appState {
        case .splash: break
        case .login:
          state.appState = .login
          state.login = .initialState
         
        case .main:
          state.appState = .main
          state.main = .initialState
        }
        
      default: break
      }
      
      return .none
    }
  }
}


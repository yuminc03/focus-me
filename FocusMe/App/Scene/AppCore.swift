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
  
  enum Action {
    case main(MainTabCoordinator.Action)
    case login(LoginCoordinator.Action)
    
    case _onAppear
    case _getCurrentUser
    case _changeAppState(AppState)
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
      case .main: break
      case .login(.router(.routeAction(id: _, action: .login(.delegate(.main))))):
        state.appState = .main
        state.main = .initialState
        
      case .login(.router(.routeAction(id: _, action: .signup(.delegate(.main))))):
        state.appState = .main
        state.main = .initialState
        
      case ._onAppear:
        return .send(._getCurrentUser)
        
      case ._getCurrentUser:
        return .run { send in
          try await AuthenticationService.shared.getCurrentUser()
          await send(._changeAppState(.main))
        } catch: { error, send in
          await send(._changeAppState(.login))
        }
        
      case let ._changeAppState(appState):
        state.appState = appState
        
      default: break
      }
      
      return .none
    }
  }
}

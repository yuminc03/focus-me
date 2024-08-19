import SwiftUI

import ComposableArchitecture
import TCACoordinators

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
    case home
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
      case .login: break
      case ._onAppear:
        return .send(._getCurrentUser)
        
      case ._getCurrentUser:
        return .run { send in
          try await AuthenticationService.shared.getCurrentUser()
          await send(._changeAppState(.home))
        } catch: { error, send in
          await send(._changeAppState(.login))
        }
        
      case let ._changeAppState(appState):
        state.appState = appState
      }
      
      return .none
    }
  }
}

struct AppView: View {
  @Perception.Bindable private var store: StoreOf<AppCore>
  
  init(store: StoreOf<AppCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack {
        switch store.appState {
        case .splash:
          Splash
          
        case .login:
          Login
          
        case .home:
          Home
        }
      }
    }
  }
}

private extension AppView {
  var Splash: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
    }
  }
  
  var Home: some View {
    MainTabCoordinatorView(store: store.scope(state: \.main, action: \.main))
  }
  
  var Login: some View {
    LoginCoordinatorView(store: store.scope(state: \.login, action: \.login))
  }
}

#Preview {
  AppView(store: .init(initialState: .initialState) {
    AppCore()
  })
}

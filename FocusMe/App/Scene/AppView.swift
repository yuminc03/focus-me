import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct AppCore {
  @ObservableState
  struct State: Equatable {
    static let initialState = State(
      appState: .splash,
      main: .initialState
    )
    
    var appState: AppState
    
    var main: MainTabCoordinator.State
  }
  
  enum AppState {
    case splash
    case login
    case home
  }
  
  enum Action {
    case main(MainTabCoordinator.Action)
    case _onAppear
    case _getCurrentUser
    case _changeAppState(AppState)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.main, action: \.main) {
      MainTabCoordinator()
    }
    Reduce { state, action in
      switch action {
      case .main: break
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
//    NavigationStack(path: $coordinator.route) {
//      LoginView()
//        .navigationDestination(for: Destination.self) { screen in
//          screen.view
//            .environmentObject(vm)
//        }
//    }
//    .environmentObject(coordinator)
    Text("")
  }
}

#Preview {
  AppView(store: .init(initialState: .initialState) {
    AppCore()
  })
}

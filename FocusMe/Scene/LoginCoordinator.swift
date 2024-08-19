import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct LoginCoordinator {
  struct State: Equatable {
    static let initialState = State(routes: [.root(.login(.init()), embedInNavigationView: true)])
    var routes: IdentifiedArrayOf<Route<LoginScreen.State>>
  }
  
  enum Action {
    case router(IdentifiedRouterActionOf<LoginScreen>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
    .forEachRoute(\.routes, action: \.router) {
      LoginScreen()
    }
  }
}

struct LoginCoordinatorView: View {
  let store: StoreOf<LoginCoordinator>
  
  var body: some View {
    TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .login:
          CaseLet(
            \LoginScreen.State.login,
             action: LoginScreen.Action.login,
             then: LoginView.init
          )
          
        case .signup:
          CaseLet(
            \LoginScreen.State.signup,
             action: LoginScreen.Action.signup,
             then: SignUpView.init
          )
        }
      }
    }
  }
}

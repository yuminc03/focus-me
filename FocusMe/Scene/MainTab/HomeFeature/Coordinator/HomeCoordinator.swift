import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct HomeCoordinator {
  struct State: Equatable {
    static let initialState = State(routes: [.root(.home(.init()), embedInNavigationView: true)])
    var routes: IdentifiedArrayOf<Route<HomeScreen.State>>
  }
  
  enum Action {
    case router(IdentifiedRouterActionOf<HomeScreen>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
    .forEachRoute(\.routes, action: \.router) {
      HomeScreen()
    }
  }
}

struct HomeCoordinatorView: View {
  let store: StoreOf<HomeCoordinator>
  
  var body: some View {
    TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .home:
          CaseLet(
            \HomeScreen.State.home,
             action: HomeScreen.Action.home,
             then: HomeView.init
          )
        }
      }
    }
  }
}

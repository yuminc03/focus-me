import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct OfficialMBTICoordinator {
  struct State: Equatable {
    static let initialState = State(routes: [.root(.main(.init()), embedInNavigationView: false)])
    let id = UUID()
    var routes: IdentifiedArrayOf<Route<OfficialMBTIScreen.State>>
  }
  
  enum Action {
    case router(IdentifiedRouterActionOf<OfficialMBTIScreen>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      default: break
      }
      
      return .none
    }
    .forEachRoute(\.routes, action: \.router) {
      OfficialMBTIScreen()
    }
  }
}

struct OfficialMBTICoordinatorView: View {
  let store: StoreOf<OfficialMBTICoordinator>
  
  var body: some View {
    TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .main:
          CaseLet(
            \OfficialMBTIScreen.State.main,
             action: OfficialMBTIScreen.Action.main,
             then: OfficialMBTIMainView.init
          )
        }
      }
    }
  }
}

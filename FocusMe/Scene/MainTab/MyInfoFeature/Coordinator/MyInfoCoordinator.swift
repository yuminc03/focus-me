import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct MyInfoCoordinator {
  struct State: Equatable {
    static let initialState = State(routes: [.root(.myInfo(.init()), embedInNavigationView: true)])
    var routes: IdentifiedArrayOf<Route<MyInfoScreen.State>>
  }
  
  enum Action {
    case router(IdentifiedRouterActionOf<MyInfoScreen>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
    .forEachRoute(\.routes, action: \.router) {
      MyInfoScreen()
    }
  }
}

struct MyInfoCoordinatorView: View {
  let store: StoreOf<MyInfoCoordinator>
  
  var body: some View {
    TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .myInfo:
          CaseLet(
            \MyInfoScreen.State.myInfo,
             action: MyInfoScreen.Action.myInfo,
             then: MyInfoMainView.init
          )
        }
      }
    }
  }
}

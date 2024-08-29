import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct MBTITestCoordinator {
  struct State: Equatable {
    static let initialState = State(routes: [.root(.testMain(.init()), embedInNavigationView: false)])
    let id = UUID()
    var routes: IdentifiedArrayOf<Route<MBTITestScreen.State>>
  }
  
  enum Action {
    case router(IdentifiedRouterActionOf<MBTITestScreen>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .router(.routeAction(id: _, action: .testMain(.delegate(.momentOfEnergy)))):
        state.routes.push(.momentOfEnergy(.init()))
        
      default: break
      }
      
      return .none
    }
    .forEachRoute(\.routes, action: \.router) {
      MBTITestScreen()
    }
  }
}

struct MBTITestCoordinatorView: View {
  let store: StoreOf<MBTITestCoordinator>
  
  var body: some View {
    TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .testMain:
          CaseLet(
            \MBTITestScreen.State.testMain,
             action: MBTITestScreen.Action.testMain,
             then: TestMainView.init
          )
          
        case .momentOfEnergy:
          CaseLet(
            \MBTITestScreen.State.momentOfEnergy,
             action: MBTITestScreen.Action.momentOfEnergy,
             then: MomentOfEnergyView.init
          )
        }
      }
    }
  }
}

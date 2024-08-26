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
      switch action {
        // home
      case .router(.routeAction(id: _, action: .home(.delegate(.allTypes)))):
        state.routes.push(.allTypes(.initialState))
        
      case .router(.routeAction(id: _, action: .home(.delegate(.mbtiTest)))):
        state.routes.push(.mbtiTest(.initialState))
        
        // allTypes
      case .router(.routeAction(id: _, action: .allTypes(.router(.routeAction(_, action: .allTypesMain(.delegate(.back))))))):
        state.routes.pop()
        
      default: break
      }
      
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
          
        case .mbtiTest:
          CaseLet(
            \HomeScreen.State.mbtiTest,
             action: HomeScreen.Action.mbtiTest,
             then: MBTITestCoordinatorView.init
          )
          
          case .allTypes:
          CaseLet(
            \HomeScreen.State.allTypes,
             action: HomeScreen.Action.allTypes,
             then: AllTypesCoordinatorView.init
          )
        }
      }
    }
  }
}

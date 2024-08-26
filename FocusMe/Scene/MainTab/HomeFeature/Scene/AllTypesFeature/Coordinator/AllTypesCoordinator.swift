import SwiftUI

import ComposableArchitecture
import TCACoordinators

@Reducer
struct AllTypesCoordinator {
  struct State: Equatable {
    static let initialState = State(routes: [.root(.allTypesMain(.init()), embedInNavigationView: false)])
    let id = UUID()
    var routes: IdentifiedArrayOf<Route<AllTypesScreen.State>>
  }
  
  enum Action {
    case router(IdentifiedRouterActionOf<AllTypesScreen>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
        // allTypesMain
      case let .router(.routeAction(id: _, action: .allTypesMain(.delegate(.detail(type))))):
        state.routes.push(.typeDetail(.init(type: type)))
        
      default: break
      }
      
      return .none
    }
    .forEachRoute(\.routes, action: \.router) {
      AllTypesScreen()
    }
  }
}

struct AllTypesCoordinatorView: View {
  let store: StoreOf<AllTypesCoordinator>
  
  var body: some View {
    TCARouter(store.scope(state: \.routes, action: \.router)) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .allTypesMain:
          CaseLet(
            \AllTypesScreen.State.allTypesMain,
             action: AllTypesScreen.Action.allTypesMain,
             then: AllTypesView.init
          )
          
        case .typeDetail:
          CaseLet(
            \AllTypesScreen.State.typeDetail,
             action: AllTypesScreen.Action.typeDetail,
             then: TypeDetailView.init
          )
        }
      }
    }
  }
}

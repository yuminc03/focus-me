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
        // MARK: - allTypesMain
        
        // 모든 MBTI 유형 Collection 화면에서 특정 MBTI를 눌렀을 때
      case let .router(.routeAction(id: _, action: .allTypesMain(.delegate(.detail(type))))):
        state.routes.push(.typeDetail(.init(type: type)))
        
        // MARK: - typeDetail
        
        // MBTI Detail 화면에서 뒤로가기 눌렀을 때
      case .router(.routeAction(id: _, action: .typeDetail(.delegate(.back)))):
        state.routes.goBack()
        
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

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
        // MARK: - home
        
        // 홈 화면에서 MBTI 검사하기 눌렀을 때
      case .router(.routeAction(id: _, action: .home(.delegate(.mbtiTest)))):
        state.routes.push(.mbtiTest(.initialState))
        
        // 홈 화면에서 MBTI의 모든 유형 살펴보기 눌렀을 때
      case .router(.routeAction(id: _, action: .home(.delegate(.allTypes)))):
        state.routes.push(.allTypes(.initialState))
        
        // 홈 화면에서 MBTI 정식 검사 받아보기 눌렀을 때
      case .router(.routeAction(id: _, action: .home(.delegate(.officialMBTI)))):
        state.routes.push(.officialMBTI(.initialState))
        
        // MARK: - mbtiTest
        
        // MBTI 테스트 메인화면에서 뒤로 가기 눌렀을 때
      case .router(.routeAction(id: _, action: .mbtiTest(.router(.routeAction(id: _, action: .testMain(.delegate(.back))))))):
        state.routes.pop()
        
        // MBTI 테스트 결과를 본 후 홈 화면으로 돌아옴
      case .router(.routeAction(id: _, action: .mbtiTest(.router(.routeAction(id: _, action: .testResult(.delegate(.home))))))):
        state.routes.popToRoot()
        
        // MARK: - allTypes
        
        // MBTI 테스트를 하다가 뒤로 가기 눌렀을 때
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
          
        case .officialMBTI:
          CaseLet(
            \HomeScreen.State.officialMBTI,
             action: HomeScreen.Action.officialMBTI,
             then: OfficialMBTICoordinatorView.init
          )
        }
      }
    }
  }
}

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
      switch action {
        // MARK: - MyInfo
        
        // 내 정보 화면에서 로그인 설정 Row 눌렀을 때
      case .router(.routeAction(id: _, action: .myInfo(.delegate(.detail(.loginSetting))))):
        state.routes.push(.loginSetting(.init()))
        
        // MARK: - LoginSetting
        
        // 로그인 설정 화면에서 뒤로가기 눌렀을 때
      case .router(.routeAction(id: _, action: .loginSetting(.delegate(.back)))):
        state.routes.goBack()
        
      default:
        break
      }
      
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
          
        case .loginSetting:
          CaseLet(
            \MyInfoScreen.State.loginSetting,
             action: MyInfoScreen.Action.loginSetting,
             then: LoginSettingView.init
          )
        }
      }
    }
  }
}

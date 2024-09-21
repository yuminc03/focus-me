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
      switch action {
        // MARK: - login
        
        // 로그인 화면에서 회원가입하러가기 버튼 눌렀을 때
      case .router(.routeAction(id: _, action: .login(.delegate(.signup)))):
        state.routes.push(.signup(.init()))
        
        // MARK: - signup
        
        // 회원가입 화면에서 이미 계정이 있나요? 버튼 눌렀을 때
      case .router(.routeAction(id: _, action: .signup(.delegate(.login)))):
        state.routes.pop()
        
        // 회원가입 화면에서 뒤로가기 버튼 눌렀을 때
      case .router(.routeAction(id: _, action: .signup(.delegate(.back)))):
        state.routes.goBack()
        
      default: break
      }
      
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

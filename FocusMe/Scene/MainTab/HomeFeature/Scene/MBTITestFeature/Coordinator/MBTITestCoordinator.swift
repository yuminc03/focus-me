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
  
  @Dependency(\.mbtiTestStep) var mbtiTestStep
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
        // testMain
      case .router(.routeAction(id: _, action: .testMain(.delegate(.momentOfEnergy)))):
        state.routes.push(.mbtiTestQuestion(.init(
          question: mbtiTestStep.currentStep,
          pastAnswers: mbtiTestStep.currentStep.selection
        )))
        
        // mbtiTestQuestion
      case .router(.routeAction(id: _, action: .mbtiTestQuestion(.delegate(.back)))):
        mbtiTestStep.backStep()
        state.routes.pop()
        
      case let .router(.routeAction(id: _, action: .mbtiTestQuestion(.delegate(.next(entity))))):
        guard let question = mbtiTestStep.nextStep() else { return .none }
        if mbtiTestStep.currentStep == .myWayPartying {
          // 현재 마지막 테스트 단계 -> 테스트 완료 페이지
        } else {
          // 테스트 진행 단계 -> 다음 단계 페이지
          state.routes.push(.mbtiTestQuestion(.init(question: question, pastAnswers: question.selection)))
        }
        
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
          
        case .mbtiTestQuestion:
          CaseLet(
            \MBTITestScreen.State.mbtiTestQuestion,
             action: MBTITestScreen.Action.mbtiTestQuestion,
             then: MBTITestQestionView.init
          )
        }
      }
    }
  }
}

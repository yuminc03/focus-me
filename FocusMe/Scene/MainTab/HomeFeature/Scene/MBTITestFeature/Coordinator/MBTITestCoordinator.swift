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
        // MARK: - testMain
        
        // MBTI 테스트 화면으로 들어옴
      case .router(.routeAction(id: _, action: .testMain(.delegate(.momentOfEnergy)))):
        state.routes.push(.mbtiTestQuestion(.init(
          question: mbtiTestStep.currentStep,
          pastAnswers: mbtiTestStep.currentStep.selection
        )))
        
        // MARK: - mbtiTestQuestion
        
        // MBTI 테스트를 하다가 이전 질문으로 돌아갈 때
      case .router(.routeAction(id: _, action: .mbtiTestQuestion(.delegate(.back)))):
        mbtiTestStep.backStep()
        state.routes.pop()
        
        // MBTI 테스트를 하면서 다음 질문으로 넘어갔을 때
      case let .router(.routeAction(id: _, action: .mbtiTestQuestion(.delegate(.next(entity))))):
        guard let question = mbtiTestStep.nextStep() else { return .none }
        if mbtiTestStep.currentStep == .myWayPartying {
          // 현재 마지막 테스트 단계 -> 테스트 완료 페이지
          state.routes.push(.completeTest(.init()))
        } else {
          // 테스트 진행 단계 -> 다음 단계 페이지
          state.routes.push(.mbtiTestQuestion(.init(question: question, pastAnswers: question.selection)))
        }
        
        // MARK: - completeTest
        
        // MBTI 테스트 완료화면에서 결과화면으로 들어옴
      case let .router(.routeAction(id: _, action: .completeTest(.delegate(.myMBTIResult(score))))):
        state.routes.push(.testResult(.init(score: score)))
        
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
             then: MBTITestQuestionView.init
          )
          
        case .completeTest:
          CaseLet(
            \MBTITestScreen.State.completeTest,
             action: MBTITestScreen.Action.completeTest,
             then: CompleteTestView.init
          )
          
        case .testResult:
          CaseLet(
            \MBTITestScreen.State.testResult, 
             action: MBTITestScreen.Action.testResult,
             then: TestResultView.init
          )
        }
      }
    }
  }
}

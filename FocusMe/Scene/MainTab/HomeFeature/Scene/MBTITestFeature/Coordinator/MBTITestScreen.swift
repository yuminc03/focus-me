import SwiftUI

import ComposableArchitecture

@Reducer
struct MBTITestScreen {
  enum State: Equatable, Identifiable {
    case testMain(TestMainCore.State)
    case mbtiTestQuestion(MBTITestQuestionCore.State)
    case completeTest(CompleteTestCore.State)
    case testResult(TestResultCore.State)
    
    var id: UUID {
      switch self {
      case let .testMain(state):
        return state.id
        
      case let .mbtiTestQuestion(state):
        return state.id
        
      case let .completeTest(state):
        return state.id
        
      case let .testResult(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case testMain(TestMainCore.Action)
    case mbtiTestQuestion(MBTITestQuestionCore.Action)
    case completeTest(CompleteTestCore.Action)
    case testResult(TestResultCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.testMain, action: \.testMain) {
      TestMainCore()
    }
    Scope(state: \.mbtiTestQuestion, action: \.mbtiTestQuestion) {
      MBTITestQuestionCore()
    }
    Scope(state: \.completeTest, action: \.completeTest) {
      CompleteTestCore()
    }
    Scope(state: \.testResult, action: \.testResult) {
      TestResultCore()
    }
  }
}

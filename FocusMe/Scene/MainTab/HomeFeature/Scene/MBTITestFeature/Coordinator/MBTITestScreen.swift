import SwiftUI

import ComposableArchitecture

@Reducer
struct MBTITestScreen {
  enum State: Equatable, Identifiable {
    case testMain(TestMainCore.State)
    case mbtiTestQuestion(MBTITestQuestionCore.State)
    
    var id: UUID {
      switch self {
      case let .testMain(state):
        return state.id
        
      case let .mbtiTestQuestion(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case testMain(TestMainCore.Action)
    case mbtiTestQuestion(MBTITestQuestionCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.testMain, action: \.testMain) {
      TestMainCore()
    }
    Scope(state: \.mbtiTestQuestion, action: \.mbtiTestQuestion) {
      MBTITestQuestionCore()
    }
  }
}

import Foundation

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo
  
  enum Action {
    case delegate(Delegate)
    case tapConfirmButton
    
    case _onAppear
    case _calculateScore
    
    enum Delegate {
      case myMBTIResult
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapConfirmButton:
        return .send(.delegate(.myMBTIResult))
        
      case ._onAppear:
        return .send(._calculateScore)
        
      case ._calculateScore: break
      }
      
      return .none
    }
  }
}

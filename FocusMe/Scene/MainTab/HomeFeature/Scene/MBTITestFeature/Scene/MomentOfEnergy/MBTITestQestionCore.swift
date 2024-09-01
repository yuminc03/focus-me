import Foundation

import ComposableArchitecture

@Reducer
struct MBTITestQestionCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    let question: MBTIQuestion
    var pastAnswers: [MBTIAnswerEntity]
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo

  enum Action {
    case delegate(Delegate)
    
    case tapBackButton
    case tapMomentButton(MBTIAnswerEntity)
    
    enum Delegate {
      case back
      case next(MBTIAnswerEntity)
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapMomentButton(answer):
        guard let index = state.pastAnswers.firstIndex(of: answer) else { return .none }
        
        for i in 0 ..< state.pastAnswers.count {
          state.pastAnswers[i].isSelected = false
        }

        state.pastAnswers[index].isSelected = true
        return .send(.delegate(.next(state.pastAnswers[index])))
      }
      
      return .none
    }
  }
}


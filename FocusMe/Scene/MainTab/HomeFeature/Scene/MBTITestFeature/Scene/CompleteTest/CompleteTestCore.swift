import Foundation

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
  final class Score {
    /// 외향
    var extraversion = 0
    /// 내향
    var introversion = 0
    /// 감각
    var sensing = 0
    /// 직관
    var intuition = 0
    /// 사고
    var thinking = 0
    /// 감정
    var feeling = 0
    /// 판단
    var judging = 0
    /// 인식
    var perceiving = 0
  }
  
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

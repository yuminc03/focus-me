import Foundation

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
  /// MBTI 테스트 점수
  struct Score: Equatable {
    /// 외향
    let extraversion: Int
    /// 내향
    let introversion: Int
    /// 감각
    let sensing: Int
    /// 직관
    let intuition: Int
    /// 사고
    let thinking: Int
    /// 감정
    let feeling: Int
    /// 판단
    let judging: Int
    /// 인식
    let perceiving: Int
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var score: Score?
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo
  
  enum Action {
    case delegate(Delegate)
    case tapConfirmButton
    
    case _onAppear
    case _calculateScore
    
    enum Delegate {
      case myMBTIResult(Score)
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapConfirmButton:
        guard let score = state.score else { break }
        
        return .send(.delegate(.myMBTIResult(score)))
        
      case ._onAppear:
        return .send(._calculateScore)
        
      case ._calculateScore:
        state.score = Score(
          extraversion: testAnswerInfo.extraversionScore,
          introversion: testAnswerInfo.introversionScore,
          sensing: testAnswerInfo.sensingScore,
          intuition: testAnswerInfo.intuitionScore,
          thinking: testAnswerInfo.thinkingScore, 
          feeling: testAnswerInfo.feelingScore,
          judging: testAnswerInfo.judgingScore, 
          perceiving: testAnswerInfo.perceivingScore
        )
      }
      
      return .none
    }
  }
}

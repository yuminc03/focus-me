import Foundation

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var score: MBTITestScore?
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo
  
  enum Action {
    case delegate(Delegate)
    case tapConfirmButton
    
    case _onAppear
    case _calculateScore
    
    enum Delegate {
      case myMBTIResult(MBTITestScore)
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
        let score = MBTITestScore(
          extraversion: testAnswerInfo.extraversionScore,
          introversion: testAnswerInfo.introversionScore,
          sensing: testAnswerInfo.sensingScore,
          intuition: testAnswerInfo.intuitionScore,
          thinking: testAnswerInfo.thinkingScore, 
          feeling: testAnswerInfo.feelingScore,
          judging: testAnswerInfo.judgingScore, 
          perceiving: testAnswerInfo.perceivingScore
        )
        state.score = score
        print("score: \(score)")
        
        var mbti = ""
        mbti.append(score.extraversion > score.introversion ? "E" : "I")
        mbti.append(score.sensing > score.intuition ? "S" : "N")
        mbti.append(score.thinking > score.feeling ? "T" : "F")
        mbti.append(score.judging > score.perceiving ? "J" : "P")
        
        testAnswerInfo.mbti = MBTI.allCases.filter({ $0.name == mbti }).first
      }
      
      return .none
    }
  }
}

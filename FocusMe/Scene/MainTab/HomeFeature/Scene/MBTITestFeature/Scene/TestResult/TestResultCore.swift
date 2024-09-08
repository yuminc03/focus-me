import Foundation

import ComposableArchitecture

@Reducer
struct TestResultCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    let score: MBTITestScore
    var mbti: MBTI = .istj
    
    /// 에너지의 방향
    var energyScore: CGFloat = 0
    /// 인식기능
    var informationScore: CGFloat = 0
    /// 판단기능
    var decisionScore: CGFloat = 0
    /// 생활양식
    var lifeStyleScore: CGFloat = 0
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo
  
  enum Action {
    case tapConfirmButton
    
    case _onAppear
    case _getMBTI
    case _getTestScore
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .tapConfirmButton: break
      case ._onAppear:
        return .run { send in
          await send(._getMBTI)
          await send(._getTestScore)
        }
        
      case ._getMBTI:
        guard let mbti = testAnswerInfo.mbti else {
          print("MBTI가 없습니다.")
          break
        }
        
        state.mbti = mbti
        
      case ._getTestScore:
        if state.score.extraversion > state.score.introversion {
          state.energyScore = CGFloat(state.score.extraversion)
        } else {
          state.energyScore = CGFloat(state.score.introversion)
        }
        
        if state.score.sensing > state.score.intuition {
          state.informationScore = CGFloat(state.score.sensing)
        } else {
          state.informationScore = CGFloat(state.score.intuition)
        }
        
        if state.score.thinking > state.score.feeling {
          state.decisionScore = CGFloat(state.score.thinking)
        } else {
          state.decisionScore = CGFloat(state.score.feeling)
        }
        
        if state.score.judging > state.score.perceiving {
          state.lifeStyleScore = CGFloat(state.score.judging)
        } else {
          state.lifeStyleScore = CGFloat(state.score.perceiving)
        }
      }
      
      return .none
    }
  }
}

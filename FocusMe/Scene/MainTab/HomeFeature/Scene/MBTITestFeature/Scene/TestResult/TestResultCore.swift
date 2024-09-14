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
  
  private let mbtiRepo = MBTIRepository()
  
  enum Action {
    case delegate(Delegate)
    case tapConfirmButton
    
    case _onAppear
    case _getMBTI
    case _getTestScore
    case _requestSaveMBTI
    case _saveMBTIResponse(Result<Int, FMError>)
    
    enum Delegate {
      case home
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapConfirmButton:
        return .send(._requestSaveMBTI)
        
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
        
      case ._requestSaveMBTI:
        guard let uid = UserInfo.shared.uid else {
          print("로그인한 사용자가 없습니다.")
          break
        }
        
        let entity = MBTITestResult(
          id: uid, 
          mbti: state.mbti.name,
          energyScore: Int(state.energyScore),
          informationScore: Int(state.informationScore),
          decisionScore: Int(state.decisionScore),
          lifeStyleScore: Int(state.lifeStyleScore)
        )
        return .run { send in
          try await mbtiRepo.saveMBTIResult(target: .saveMBTIResult(entity))
          await send(._saveMBTIResponse(.success(0)))
        } catch: { error, send in
          await send(._saveMBTIResponse(.failure(error.toFMError)))
        }
        
      case ._saveMBTIResponse(.success):
        testAnswerInfo.clear()
        return .send(.delegate(.home))
        
      case let ._saveMBTIResponse(.failure(error)):
        print(error.localizedDescription)
      }
      
      return .none
    }
  }
}

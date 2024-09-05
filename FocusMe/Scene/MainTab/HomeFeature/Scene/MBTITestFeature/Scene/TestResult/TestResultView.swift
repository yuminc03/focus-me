import SwiftUI

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
    case _onAppear
    case _getMBTI
    case _getTestScore
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
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

struct TestResultView: View {
  @Perception.Bindable private var store: StoreOf<TestResultCore>
  
  init(store: StoreOf<TestResultCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 30) {
        TitleSection
          .padding(.top, 56)
        
        ScoreProgressBarSection
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .navigationBarHidden(true)
      .onAppear {
        NotiManager.post(key: .hideTab)
        store.send(._onAppear)
      }
    }
  }
}

private extension TestResultView {
  var TitleSection: some View {
    VStack(spacing: 10) {
      Text("당신의 MBTI는 ...")
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(
        "\(store.mbti.name)"
          .attributedString(
            color: .skyblue,
            fontName: .notoSansKRBlack,
            fontSize: 24
          ) +
        "입니다~! 🎉"
      )
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .customFont(.notoSansKRSemiBold, size: 24)
    .foregroundColor(.deepPurple)
  }
  
  var ScoreProgressBarSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("나의 성향은 얼마나 확실할까?")
        .customFont(.notoSansKRMedium, size: 16)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      VStack(spacing: 10) {
        ProgressView(
          "\(store.score.extraversion > store.score.introversion ? "E" : "I"): \(Int(store.energyScore) * 20)%",
          value: store.energyScore,
          total: 5
        )
        
        ProgressView(
          "\(store.score.sensing > store.score.intuition ? "S" : "N"): \(Int(store.informationScore) * 20)%",
          value: store.informationScore,
          total: 5
        )
        
        ProgressView(
          "\(store.score.thinking > store.score.feeling ? "T" : "F"): \(Int(store.decisionScore) * 20)%",
          value: store.decisionScore,
          total: 5
        )
        
        ProgressView(
          "\(store.score.judging > store.score.perceiving ? "J" : "P"): \(Int(store.lifeStyleScore) * 20)%",
          value: store.lifeStyleScore,
          total: 5
        )
      }
    }
    .foregroundColor(.deepPurple)
  }
}

#Preview {
  TestResultView(store: .init(initialState: .init(score: .init(extraversion: 0, introversion: 0, sensing: 0, intuition: 0, thinking: 0, feeling: 0, judging: 0, perceiving: 0))) {
    TestResultCore()
  })
}

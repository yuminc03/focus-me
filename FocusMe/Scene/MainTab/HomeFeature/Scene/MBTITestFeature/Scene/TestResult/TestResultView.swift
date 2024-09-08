import SwiftUI

import ComposableArchitecture

struct TestResultView: View {
  @Perception.Bindable private var store: StoreOf<TestResultCore>
  
  init(store: StoreOf<TestResultCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ScrollView {
        VStack(spacing: 30) {
          TitleSection
            .padding(.top, 56)
          
          ScoreProgressBarSection
          DispositionSection
          StrengthSection
          WeakPointSection
          AdviceSection
          ConfirmButton
            .padding(.vertical, 20)
        }
        .padding(.horizontal, 20)
      }
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
    VStack(spacing: 0) {
      Text("당신의 MBTI는...")
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Text(
        "\(store.mbti.name)"
          .attributedString(
            color: .white,
            fontName: .notoSansKRSemiBold,
            fontSize: 36
          ) + "입니다~! 🎉"
      )
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .customFont(.notoSansKRSemiBold, size: 32)
    .foregroundColor(.deepPurple)
  }
  
  var ScoreProgressBarSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("나의 성향은 얼마나 확실할까?")
        .customFont(.notoSansKRMedium, size: 20)
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
  
  var DispositionSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("\(store.mbti.description), \(store.mbti.name)")
        .customFont(.notoSansKRMedium, size: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.deepPurple)
      
      Text(store.mbti.disposition)
        .foregroundColor(.textPrimary1)
        .customFont(size: 16)
    }
  }
  
  var StrengthSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("\(store.mbti.name)의 장점")
        .customFont(.notoSansKRMedium, size: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.deepPurple)
      
      VStack(alignment: .leading, spacing: 10) {
        ForEach(0 ..< store.mbti.strengths.count, id: \.self) { index in
          Text("☀️ \(store.mbti.strengths[index])")
            .foregroundColor(.textPrimary1)
            .customFont(size: 16)
        }
      }
    }
  }
  
  var WeakPointSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("\(store.mbti.name)의 약점")
        .customFont(.notoSansKRMedium, size: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.deepPurple)
      
      VStack(alignment: .leading, spacing: 10) {
        ForEach(0 ..< store.mbti.strengths.count, id: \.self) { index in
          Text("☁️ \(store.mbti.strengths[index])")
            .foregroundColor(.textPrimary1)
            .customFont(size: 16)
        }
      }
    }
  }
  
  var AdviceSection: some View {
    VStack(alignment: .leading, spacing: 20) {
      Text("\(store.mbti.name)에게 하는 조언")
        .customFont(.notoSansKRMedium, size: 20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.deepPurple)
      
      Text("💡 \(store.mbti.advice)")
        .foregroundColor(.textPrimary1)
        .customFont(size: 16)
    }
  }
  
  var ConfirmButton: some View {
    FMButton(title: "확인했습니다.") {
      store.send(.tapConfirmButton)
    }
  }
}

#Preview {
  TestResultView(store: .init(initialState: .init(score: .init(
    extraversion: 0,
    introversion: 0,
    sensing: 0,
    intuition: 0,
    thinking: 0,
    feeling: 0,
    judging: 0,
    perceiving: 0
  ))) {
    TestResultCore()
  })
}

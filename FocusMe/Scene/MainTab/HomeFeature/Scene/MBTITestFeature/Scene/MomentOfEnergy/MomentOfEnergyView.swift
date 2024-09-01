import SwiftUI

import ComposableArchitecture

/// 에너지를 얻는 순간은 언제인가요? 질문
struct MomentOfEnergyView: View {
  @Perception.Bindable private var store: StoreOf<MomentOfEnergyCore>
  
  init(store: StoreOf<MomentOfEnergyCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 20) {
        ProgressBar
          .padding(.top, 30)
        
        TitleSection
        
        Spacer()
        
        ContentsSection
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .fmNavigation(title: "MBTI 검사하기") {
        store.send(.tapBackButton)
      }
      .onAppear {
        NotiManager.post(key: .hideTab)
      }
    }
  }
}

private extension MomentOfEnergyView {
  var ProgressBar: some View {
    MBTITestProgressView(progressValue: 1)
  }
  
  var TitleSection: some View {
    Text(store.question.title)
      .customFont(.notoSansKRSemiBold, size: 24)
      .foregroundColor(.textPrimary1)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var ContentsSection: some View {
    LazyVStack(spacing: 20) {
      ForEach(store.pastAnswers) { answer in
        SelectionButton(title: answer.type.title, isSelected: answer.isSelected) {
          store.send(.tapMomentButton(answer))
        }
      }
    }
  }
}

#Preview {
  MomentOfEnergyView(store: .init(initialState: MomentOfEnergyCore.State(
    question: .momentOfEnergy,
    pastAnswers: MBTIAnswer.momentOfEnergy.selection
  )) {
    MomentOfEnergyCore()
  })
}

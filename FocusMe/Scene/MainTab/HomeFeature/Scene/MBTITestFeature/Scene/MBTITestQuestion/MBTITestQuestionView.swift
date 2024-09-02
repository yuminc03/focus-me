import SwiftUI

import ComposableArchitecture

/// MBTI Test 질문
struct MBTITestQuestionView: View {
  @Perception.Bindable private var store: StoreOf<MBTITestQuestionCore>
  
  init(store: StoreOf<MBTITestQuestionCore>) {
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

private extension MBTITestQuestionView {
  var ProgressBar: some View {
    MBTITestProgressView(
      progressValue: CGFloat(store.question.rawValue) + 1,
      total: CGFloat(MBTIQuestion.allCases.count)
    )
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
  MBTITestQuestionView(store: .init(initialState: MBTITestQuestionCore.State(
    question: .momentOfEnergy,
    pastAnswers: MBTIQuestion.momentOfEnergy.selection
  )) {
    MBTITestQuestionCore()
  })
}

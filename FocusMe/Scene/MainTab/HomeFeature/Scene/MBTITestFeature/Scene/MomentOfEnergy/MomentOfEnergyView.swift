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
    }
  }
}

private extension MomentOfEnergyView {
  var ProgressBar: some View {
    MBTITestProgressView(progressValue: 1)
  }
  
  var TitleSection: some View {
    Text("당신이 에너지를 얻는 순간은 언제인가요?")
      .customFont(.notoSansKRSemiBold, size: 24)
      .foregroundColor(.textPrimary1)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var ContentsSection: some View {
    VStack(spacing: 20) {
      SelectionButton(title: "사람들과 함께 시간을 보낼 때") {
        store.send(.tapTogetherButton)
      }
      
      SelectionButton(title: "혼자만의 시간을 보낼 때") {
        store.send(.tapAloneButton)
      }
    }
  }
}

#Preview {
  MomentOfEnergyView(store: .init(initialState: MomentOfEnergyCore.State()) {
    MomentOfEnergyCore()
  })
}

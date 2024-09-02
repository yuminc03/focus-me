import SwiftUI

import ComposableArchitecture

/// MBTI Test 완료 화면
struct CompleteTestView: View {
  @Perception.Bindable private var store: StoreOf<CompleteTestCore>
  
  init(store: StoreOf<CompleteTestCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 20) {
        TitleSection
          .padding(.top, 56)
        
        Spacer()
        
        CheckImage
        
        Spacer()
        
        ConfirmButton
          .padding(.bottom, 20)
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .navigationBarHidden(true)
      .onAppear {
        NotiManager.post(key: .hideTab)
      }
    }
  }
}

private extension CompleteTestView {
  var TitleSection: some View {
    VStack(spacing: 10) {
      Text("MBTI 테스트가 완료되었습니다.")
        .frame(maxWidth: .infinity, alignment: .leading)
        .customFont(.notoSansKRSemiBold, size: 24)
      Text("이제 다음 화면에서 MBTI 결과를 확인해보세요!")
        .frame(maxWidth: .infinity, alignment: .leading)
        .customFont(size: 12)
    }
    .foregroundColor(.deepPurple)
  }
  
  var CheckImage: some View {
    Image(systemName: .systemImage(.checkmarkCircle))
      .size(120)
      .foregroundColor(.skyblue)
  }
  
  var ConfirmButton: some View {
    FMButton(title: "MBTI 확인하기") {
      store.send(.tapConfirmButton)
    }
  }
}

#Preview {
  CompleteTestView(store: .init(initialState: CompleteTestCore.State()) {
    CompleteTestCore()
  })
}

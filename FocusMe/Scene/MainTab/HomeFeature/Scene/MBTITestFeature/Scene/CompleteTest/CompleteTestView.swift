import SwiftUI

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

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
        
        Spacer()
        
        
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
  
  
}

#Preview {
  CompleteTestView(store: .init(initialState: CompleteTestCore.State()) {
    CompleteTestCore()
  })
}

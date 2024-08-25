import SwiftUI

import ComposableArchitecture

/// MBTI 유형 상세 설명 화면
struct TypeDetailView: View {
  @Perception.Bindable private var store: StoreOf<TypeDetailCore>
  
  init(store: StoreOf<TypeDetailCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 10) {
        TitleSection
          .padding(.bottom, 30)
        
        ContentsSection
        
        Spacer()
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .fmNavigation(title: store.type.name) {
        store.send(.tapBackButton)
      }
      .onAppear {
        NotiManager.post(key: .hideTab)
      }
    }
  }
}

private extension TypeDetailView {
  var TitleSection: some View {
    HStack(alignment: .lastTextBaseline, spacing: 10) {
      Text(store.type.description)
        .customFont(.notoSansKRBold, size: 24)
        .foregroundColor(.textPrimary1)
      
      Text(store.type.name)
        .customFont(.notoSansKRBold, size: 36)
        .foregroundColor(.deepPurple)
    }
  }
  
  var ContentsSection: some View {
    Text(store.type.disposition)
      .customFont(size: 16)
      .foregroundColor(.textPrimary2)
  }
}

#Preview {
  TypeDetailView(store: .init(initialState: TypeDetailCore.State(type: .istj)) {
    TypeDetailCore()
  })
}

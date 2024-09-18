import SwiftUI

import ComposableArchitecture

/// 내 정보 - 로그인 설정
struct LoginSettingView: View {
  @Perception.Bindable private var store: StoreOf<LoginSettingCore>
  
  init(store: StoreOf<LoginSettingCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ScrollView {
        ListSection
      }
      .backgroundColor()
      .fmNavigation(title: "로그인 설정") {
        store.send(.tapBackButton)
      }
      .onAppear {
        NotiManager.post(key: .hideTab)
      }
    }
  }
}

private extension LoginSettingView {
  var ListSection: some View {
    VStack(spacing: 18) {
      ForEach(store.items) {
        ListRow(title: $0.title)
        
        Divider()
      }
    }
  }
}

#Preview {
  LoginSettingView(store: .init(initialState: LoginSettingCore.State()) {
    LoginSettingCore()
  })
}

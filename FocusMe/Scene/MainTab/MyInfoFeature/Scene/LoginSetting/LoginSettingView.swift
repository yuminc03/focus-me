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
      VStack(spacing: 20) {
        ListSection
          .padding(.top, 30)
        
        Spacer()
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
      ForEach(store.items) { item in
        ListRow(title: item.type.rawValue)
          .hideArrow()
          .onTapGesture {
            store.send(.tapListRow(item.type))
          }
        
        Divider()
      }
    }
    .padding(.horizontal, 20)
  }
}

#Preview {
  LoginSettingView(store: .init(initialState: LoginSettingCore.State()) {
    LoginSettingCore()
  })
}

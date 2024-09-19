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
      .fmAlert(isPresented: $store.isLogoutPresent) {
        FMAlertContainer {
          FMDefaultAlert(message: "로그아웃 하시겠습니까?")
        }
        .addButton(type: .cancel, buttonStyle: .cancel(title: "취소")) {
          store.send(.alert(.cancel))
        }
        .addButton(type: .confirm, buttonStyle: .primary(title: "확인")) {
          store.send(.alert(.confirm))
        }
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

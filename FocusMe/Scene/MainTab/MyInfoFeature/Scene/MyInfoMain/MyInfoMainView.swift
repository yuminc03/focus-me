import SwiftUI

import ComposableArchitecture

struct MyInfoMainView: View {
  @Perception.Bindable private var store: StoreOf<MyInfoMainCore>
  
  @Environment(\.openURL) var openURL
  
  init(store: StoreOf<MyInfoMainCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 50) {
        ProfileSection
          .padding(.top, 30)
        
        ListSection
        
        Spacer()
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .onAppear {
        NotiManager.post(key: .showTab)
      }
      .toast(isPresented: $store.isToastPresent, message: store.toastMessage)
    }
  }
}

private extension MyInfoMainView {
  var ProfileSection: some View {
    HStack(spacing: 10) {
      Image(systemName: .systemImage(.personCropCircle))
        .size(60)
        .foregroundColor(.deepPurple)
      
      VStack(spacing: 5) {
        Text(UDStorage.email ?? "사용자 계정 없음")
          .customFont(size: 16)
          .frame(maxWidth: .infinity, alignment: .leading)
        Text(UDStorage.name ?? "사용자 이름 없음")
          .customFont(size: 14)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .foregroundColor(.textPrimary1)
    }
  }
  
  var ListSection: some View {
    VStack(spacing: 18) {
      ForEach(store.items) { item in
        ListRow(title: item.type.rawValue)
          .onTapGesture {
            if item.type == .developer {
              if let url = URL(string: store.developerIntroURL) {
                openURL(url)
              } else {
                store.send(._setToastPresent(true))
              }
            } else if item.type == .sourceCode {
              if let url = URL(string: store.sourceURL) {
                openURL(url)
              } else {
                store.send(._setToastPresent(true))
              }
            } else {
              store.send(.tapListItem(item.type))
            }
          }
        
        Divider()
      }
    }
  }
}

#Preview {
  MyInfoMainView(store: .init(initialState: MyInfoMainCore.State()) {
    MyInfoMainCore()
  })
}

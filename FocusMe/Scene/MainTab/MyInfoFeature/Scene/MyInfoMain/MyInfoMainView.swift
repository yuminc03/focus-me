import SwiftUI

import ComposableArchitecture

@Reducer
struct MyInfoMainCore {
  struct ListItem: Equatable, Identifiable {
    let id = UUID()
    let title: String
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    let items: [ListItem] = [
      .init(title: "공지사항"),
      .init(title: "개발자 소개"),
      .init(title: "앱 소스코드"),
      .init(title: "로그인 설정"),
    ]
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

struct MyInfoMainView: View {
  @Perception.Bindable private var store: StoreOf<MyInfoMainCore>
  
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
        Text("사용자 계정")
          .customFont(size: 16)
          .frame(maxWidth: .infinity, alignment: .leading)
        Text("사용자 이름")
          .customFont(size: 14)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .foregroundColor(.textPrimary1)
    }
  }
  
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
  MyInfoMainView(store: .init(initialState: MyInfoMainCore.State()) {
    MyInfoMainCore()
  })
}

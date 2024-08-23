import SwiftUI

import ComposableArchitecture

struct HomeView: View {
  @Perception.Bindable private var store: StoreOf<HomeCore>
  
  init(store: StoreOf<HomeCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 20) {
        UserNameView
          .padding(.vertical, 20)
        
        StartTestView
        SeeAllTypesView
        GettingOfficialTestView
        
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

private extension HomeView {
  var UserNameView: some View {
    Text("\(UserInfo.shared.name ?? "noname")님 안녕하세요! 🙂")
      .customFont(.notoSansKRSemiBold, size: 28)
      .foregroundColor(.textPrimary1)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var StartTestView: some View {
    RoundedContainerButton(
      title: "MBTI 검사하기",
      iconName: .systemImage(.arrowRight),
      description: "간단하게 MBTI를 검사하고 나의 성향을\n알아보세요. 🙂"
    ) {
      store.send(.tapStartTest)
    }
  }
  
  var SeeAllTypesView: some View {
    RoundedContainerButton(
      title: "MBTI의 모든 유형 살펴보기",
      iconName: .systemImage(.arrowRight),
      description: "MBTI의 16가지 유형을 알아보세요. 🌈"
    ) {
      store.send(.tapSeeAllTypes)
    }
    .backgroundColor(.lovelyPink)
  }
  
  var GettingOfficialTestView : some View {
    RoundedContainerButton(
      title: "MBTI 정식 검사 받아보기",
      iconName: .systemImage(.arrowRight),
      description: "내 MBTI를 정식으로 검사해보고\n나를 탐색해보세요! 📑"
    ) {
      store.send(.tapGettingOfficialTest)
    }
    .backgroundColor(.lavender)
  }
}

#Preview {  
  HomeView(store: .init(initialState: HomeCore.State()) {
    HomeCore()
  })
}

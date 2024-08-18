import SwiftUI

import ComposableArchitecture

@Reducer
struct HomeCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    
    enum Delegate {
      case typeList
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

struct HomeView: View {
  @Perception.Bindable private var store: StoreOf<HomeCore>
  
  init(store: StoreOf<HomeCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ZStack {
        Color.bg
          .ignoresSafeArea()
        
        VStack(spacing: 20) {
          UserNameView
            .padding(.vertical, 20)
          
          StartTestView
          SeeAllTypesView
          GettingOfficialTest
          
          Spacer()
        }
        .padding(.horizontal, 20)
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
      
    }
  }
  
  var SeeAllTypesView: some View {
    RoundedContainerButton(
      title: "MBTI의 모든 유형 살펴보기",
      iconName: .systemImage(.arrowRight),
      description: "MBTI의 16가지 유형을 알아보세요. 🌈"
    ) {
      store.send(.delegate(.typeList))
    }
    .backgroundColor(.lovelyPink)
  }
  
  var GettingOfficialTest : some View {
    RoundedContainerButton(
      title: "MBTI 정식 검사 받아보기",
      iconName: .systemImage(.arrowRight),
      description: "내 MBTI를 정식으로 검사해보고\n나를 탐색해보세요! 📑"
    ) {
      
    }
    .backgroundColor(.lavender)
  }
}

#Preview {  
  HomeView(store: .init(initialState: HomeCore.State()) {
    HomeCore()
  })
}

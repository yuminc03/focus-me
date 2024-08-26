import SwiftUI

import ComposableArchitecture

@Reducer
struct TestMainCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    case tapNextButton
    
    enum Delegate {
      case back
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case .tapNextButton: break
      }
      
      return .none
    }
  }
}

/// MBTI Test 메인 화면
struct TestMainView: View {
  @Perception.Bindable private var store: StoreOf<TestMainCore>
  
  init(store: StoreOf<TestMainCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 36) {
        VStack(spacing: 10) {
          TitleSection
            .padding(.top, 20)
          
          DescriptionSection
        }
        
        BookImage
        
        Spacer()
        
        NextButton
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .fmNavigation(title: "") {
        store.send(.tapBackButton)
      }
    }
  }
}

private extension TestMainView {
  var TitleSection: some View {
    Text("간단하게 테스트해보는 MBTI")
      .foregroundColor(.textPrimary1)
      .customFont(.notoSansKRBold, size: 24)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var DescriptionSection: some View {
    Text("이 검사는 정식 MBTI 검사가 아닌, 자신의 MBTI를 재미로 알아볼 수 있는 테스트입니다.\n정식 MBTI 검사에 대해 궁금하시다면 홈 화면에 'MBTI 정식 검사 받아보기'를 눌러주세요!")
      .foregroundColor(.textPrimary3)
      .customFont(.notoSansKRRegular, size: 14)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var BookImage: some View {
    Image(systemName: .systemImage(.textBookClosed))
      .size(150)
      .foregroundColor(.deepPurple)
  }
  
  var NextButton: some View {
    FMButton(title: "계속하기") {
      store.send(.tapNextButton)
    }
  }
}

#Preview {
  TestMainView(store: .init(initialState: TestMainCore.State()) {
    TestMainCore()
  })
}

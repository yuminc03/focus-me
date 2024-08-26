import SwiftUI

import ComposableArchitecture

@Reducer
struct MomentOfEnergyCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    
    case tapBackButton
    
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
      }
      return .none
    }
  }
}

/// 에너지를 얻는 순간은 언제인가요? 질문
struct MomentOfEnergyView: View {
  @Perception.Bindable private var store: StoreOf<MomentOfEnergyCore>
  
  init(store: StoreOf<MomentOfEnergyCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 20) {
        ProgressBar
        TitleSection
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .fmNavigation(title: "MBTI 검사하기") {
        store.send(.tapBackButton)
      }
    }
  }
}

private extension MomentOfEnergyView {
  var ProgressBar: some View {
    MBTITestProgressView(progressValue: 1)
  }
  
  var TitleSection: some View {
    Text("당신이 에너지를 얻는 순간은 언제인가요?")
      .customFont(.notoSansKRSemiBold, size: 24)
      .foregroundColor(.textPrimary1)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {
  MomentOfEnergyView(store: .init(initialState: MomentOfEnergyCore.State()) {
    MomentOfEnergyCore()
  })
}

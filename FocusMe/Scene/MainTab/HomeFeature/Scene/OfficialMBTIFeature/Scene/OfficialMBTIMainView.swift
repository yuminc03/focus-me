import SwiftUI

import ComposableArchitecture

@Reducer
struct OfficialMBTIMainCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

/// 정식 MBTI 검사 받기 Main 화면
struct OfficialMBTIMainView: View {
  @Perception.Bindable private var store: StoreOf<OfficialMBTIMainCore>
  
  init(store: StoreOf<OfficialMBTIMainCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      Text("")
    }
  }
}

#Preview {
  OfficialMBTIMainView(store: .init(initialState: OfficialMBTIMainCore.State()) {
    OfficialMBTIMainCore()
  })
}

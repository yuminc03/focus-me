import SwiftUI

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
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

/// MBTI Test 완료 화면
struct CompleteTestView: View {
  @Perception.Bindable private var store: StoreOf<CompleteTestCore>
  
  init(store: StoreOf<CompleteTestCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      Text("")
    }
  }
}

#Preview {
  CompleteTestView(store: .init(initialState: CompleteTestCore.State()) {
    CompleteTestCore()
  })
}

import SwiftUI

import ComposableArchitecture

@Reducer
struct MyInfoCore {
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

struct MyInfoView: View {
  @Perception.Bindable private var store: StoreOf<MyInfoCore>
  
  init(store: StoreOf<MyInfoCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      Text("Hello, World!")
    }
  }
}

#Preview {
  MyInfoView(store: .init(initialState: MyInfoCore.State()) {
    MyInfoCore()
  })
}

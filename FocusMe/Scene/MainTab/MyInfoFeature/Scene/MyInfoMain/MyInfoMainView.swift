import SwiftUI

import ComposableArchitecture

@Reducer
struct MyInfoMainCore {
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

struct MyInfoMainView: View {
  @Perception.Bindable private var store: StoreOf<MyInfoMainCore>
  
  init(store: StoreOf<MyInfoMainCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      Text("Hello, World!")
        .onAppear {
          NotiManager.post(key: .showTab)
        }
    }
  }
}

private extension MyInfoMainView {
  
}

#Preview {
  MyInfoMainView(store: .init(initialState: MyInfoMainCore.State()) {
    MyInfoMainCore()
  })
}

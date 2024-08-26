import SwiftUI

import ComposableArchitecture

@Reducer
struct MBTITestScreen {
  enum State: Equatable, Identifiable {
    case testMain(TestMainCore.State)
    
    var id: UUID {
      switch self {
      case let .testMain(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case testMain(TestMainCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.testMain, action: \.testMain) {
      TestMainCore()
    }
  }
}

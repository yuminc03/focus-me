import SwiftUI

import ComposableArchitecture

@Reducer
struct MyInfoScreen {
  enum State: Equatable, Identifiable {
    case myInfo(MyInfoCore.State)
    
    var id: UUID {
      switch self {
      case let .myInfo(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case myInfo(MyInfoCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.myInfo, action: \.myInfo) {
      MyInfoCore()
    }
  }
}

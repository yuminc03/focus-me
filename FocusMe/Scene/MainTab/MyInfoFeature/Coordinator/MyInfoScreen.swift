import SwiftUI

import ComposableArchitecture

@Reducer
struct MyInfoScreen {
  enum State: Equatable, Identifiable {
    case myInfo(MyInfoMainCore.State)
    
    var id: UUID {
      switch self {
      case let .myInfo(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case myInfo(MyInfoMainCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.myInfo, action: \.myInfo) {
      MyInfoMainCore()
    }
  }
}

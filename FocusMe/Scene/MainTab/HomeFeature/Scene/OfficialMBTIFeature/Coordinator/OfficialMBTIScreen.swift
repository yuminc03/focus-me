import SwiftUI

import ComposableArchitecture

@Reducer
struct OfficialMBTIScreen {
  enum State: Equatable, Identifiable {
    case main(OfficialMBTIMainCore.State) // main 화면
    
    var id: UUID {
      switch self {
      case let .main(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case main(OfficialMBTIMainCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.main, action: \.main) {
      OfficialMBTIMainCore()
    }
  }
}

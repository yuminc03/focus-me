import SwiftUI

import ComposableArchitecture

@Reducer
struct OfficialMBTIScreen {
  enum State: Equatable, Identifiable {
    case main(OfficialMBTIMainCore.State) // main 화면
    case safariWeb(SafariWebCore.State) // Safari Web
    
    var id: UUID {
      switch self {
      case let .main(state):
        return state.id
      case let .safariWeb(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case main(OfficialMBTIMainCore.Action)
    case safariWeb(SafariWebCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.main, action: \.main) {
      OfficialMBTIMainCore()
    }
    Scope(state: \.safariWeb, action: \.safariWeb) {
      SafariWebCore()
    }
  }
}

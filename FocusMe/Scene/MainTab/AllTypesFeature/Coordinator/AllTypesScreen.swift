import SwiftUI

import ComposableArchitecture

@Reducer
struct AllTypesScreen {
  enum State: Equatable, Identifiable {
    case allTypesMain(AllTypesCore.State)
    
    var id: UUID {
      switch self {
      case let .allTypesMain(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case allTypesMain(AllTypesCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.allTypesMain, action: \.allTypesMain) {
      AllTypesCore()
    }
  }
}

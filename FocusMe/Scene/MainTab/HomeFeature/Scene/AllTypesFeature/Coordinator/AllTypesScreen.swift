import SwiftUI

import ComposableArchitecture

@Reducer
struct AllTypesScreen {
  enum State: Equatable, Identifiable {
    case allTypesMain(AllTypesCore.State)
    case typeDetail(TypeDetailCore.State)
    
    var id: UUID {
      switch self {
      case let .allTypesMain(state):
        return state.id
        
      case let .typeDetail(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case allTypesMain(AllTypesCore.Action)
    case typeDetail(TypeDetailCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.allTypesMain, action: \.allTypesMain) {
      AllTypesCore()
    }
    Scope(state: \.typeDetail, action: \.typeDetail) {
      TypeDetailCore()
    }
  }
}

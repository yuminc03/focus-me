import SwiftUI

import ComposableArchitecture

@Reducer
struct HomeScreen {
  enum State: Equatable, Identifiable {
    case home(HomeCore.State)
    case allTypes(AllTypesCoordinator.State = .initialState)
    
    var id: UUID {
      switch self {
      case let .home(state):
        return state.id
        
      case let .allTypes(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case home(HomeCore.Action)
    case allTypes(AllTypesCoordinator.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.home, action: \.home) {
      HomeCore()
    }
    Scope(state: \.allTypes, action: \.allTypes) {
      AllTypesCoordinator()
    }
  }
}

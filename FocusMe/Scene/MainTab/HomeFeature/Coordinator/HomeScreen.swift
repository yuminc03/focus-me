import SwiftUI

import ComposableArchitecture

@Reducer
struct HomeScreen {
  enum State: Equatable, Identifiable {
    case home(HomeCore.State)
    
    var id: UUID {
      switch self {
      case let .home(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case home(HomeCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.home, action: \.home) {
      HomeCore()
    }
  }
}

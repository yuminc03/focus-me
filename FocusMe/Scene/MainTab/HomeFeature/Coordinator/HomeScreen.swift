import SwiftUI

import ComposableArchitecture

@Reducer
struct HomeScreen {
  enum State: Equatable, Identifiable {
    case home(HomeCore.State)
    case mbtiTest(MBTITestCoordinator.State = .initialState)
    case allTypes(AllTypesCoordinator.State = .initialState)
    case officialMBTI(OfficialMBTICoordinator.State = .initialState)
    
    var id: UUID {
      switch self {
      case let .home(state):
        return state.id
        
      case let .mbtiTest(state):
        return state.id
        
      case let .allTypes(state):
        return state.id
        
      case let .officialMBTI(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case home(HomeCore.Action)
    case mbtiTest(MBTITestCoordinator.Action)
    case allTypes(AllTypesCoordinator.Action)
    case officialMBTI(OfficialMBTICoordinator.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.home, action: \.home) {
      HomeCore()
    }
    Scope(state: \.mbtiTest, action: \.mbtiTest) {
      MBTITestCoordinator()
    }
    Scope(state: \.allTypes, action: \.allTypes) {
      AllTypesCoordinator()
    }
    Scope(state: \.officialMBTI, action: \.officialMBTI) {
      OfficialMBTICoordinator()
    }
  }
}

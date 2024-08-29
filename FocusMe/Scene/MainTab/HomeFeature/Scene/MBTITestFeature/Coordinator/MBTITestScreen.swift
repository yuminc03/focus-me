import SwiftUI

import ComposableArchitecture

@Reducer
struct MBTITestScreen {
  enum State: Equatable, Identifiable {
    case testMain(TestMainCore.State)
    case momentOfEnergy(MomentOfEnergyCore.State)
    
    var id: UUID {
      switch self {
      case let .testMain(state):
        return state.id
        
      case let .momentOfEnergy(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case testMain(TestMainCore.Action)
    case momentOfEnergy(MomentOfEnergyCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.testMain, action: \.testMain) {
      TestMainCore()
    }
    Scope(state: \.momentOfEnergy, action: \.momentOfEnergy) {
      MomentOfEnergyCore()
    }
  }
}

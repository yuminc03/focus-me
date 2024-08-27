import Foundation

import ComposableArchitecture

@Reducer
struct MomentOfEnergyCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    
    case tapBackButton
    case tapTogetherButton
    case tapAloneButton
    
    enum Delegate {
      case back
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case .tapTogetherButton: break
      case .tapAloneButton: break
      }
      return .none
    }
  }
}


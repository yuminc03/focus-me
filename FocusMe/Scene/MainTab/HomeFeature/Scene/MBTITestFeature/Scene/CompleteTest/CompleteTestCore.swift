import Foundation

import ComposableArchitecture

@Reducer
struct CompleteTestCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    
    case tapConfirmButton
    
    enum Delegate {
      case myMBTIResult
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapConfirmButton:
        return .send(.delegate(.myMBTIResult))
      }
      
      return .none
    }
  }
}

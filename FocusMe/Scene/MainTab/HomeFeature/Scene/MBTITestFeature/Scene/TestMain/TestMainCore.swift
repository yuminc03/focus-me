import Foundation

import ComposableArchitecture

@Reducer
struct TestMainCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    case tapNextButton
    
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
        
      case .tapNextButton: break
      }
      
      return .none
    }
  }
}

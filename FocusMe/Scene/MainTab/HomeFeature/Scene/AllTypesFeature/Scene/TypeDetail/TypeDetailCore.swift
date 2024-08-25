import Foundation

import ComposableArchitecture

@Reducer
struct TypeDetailCore {
  @ObservableState
  struct State: Equatable {
    let type: MBTI
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    
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
      }
      
      return .none
    }
  }
}

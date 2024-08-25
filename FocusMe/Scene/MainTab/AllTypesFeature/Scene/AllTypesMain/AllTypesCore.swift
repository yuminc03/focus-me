import Foundation

import ComposableArchitecture

@Reducer
struct AllTypesCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    let types = MBTI.allCases
  }
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    case tapGridRow(MBTI)
    
    enum Delegate {
      case back
      case detail(MBTI)
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapGridRow(type):
        return .send(.delegate(.detail(type)))
      }
      
      return .none
    }
  }
}

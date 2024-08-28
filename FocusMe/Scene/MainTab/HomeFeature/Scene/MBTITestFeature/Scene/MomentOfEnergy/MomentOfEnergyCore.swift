import Foundation

import ComposableArchitecture

@Reducer
struct MomentOfEnergyCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  @Dependency(\.testAnswerEntity) var testAnswerEntity

  enum Action {
    case delegate(Delegate)
    
    case tapBackButton
    case tapTogetherButton
    case tapAloneButton
    
    enum Delegate {
      case back
      case next
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case .tapTogetherButton:
        testAnswerEntity.extraversion += 1
        return .send(.delegate(.next))

      case .tapAloneButton:
        testAnswerEntity.introversion += 1
        return .send(.delegate(.next))
      }
      
      return .none
    }
  }
}


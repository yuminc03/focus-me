import Foundation

import ComposableArchitecture

@Reducer
struct HomeCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    case delegate(Delegate)
    
    case tapStartTest
    case tapSeeAllTypes
    case tapGettingOfficialTest
    
    enum Delegate {
      case typeList
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapStartTest: break
      case .tapSeeAllTypes:
        return .send(.delegate(.typeList))
        
      case .tapGettingOfficialTest: break
      }
      
      return .none
    }
  }
}

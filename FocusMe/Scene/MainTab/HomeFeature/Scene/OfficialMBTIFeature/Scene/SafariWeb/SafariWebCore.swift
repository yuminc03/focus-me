import Foundation

import ComposableArchitecture

@Reducer
struct SafariWebCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var safariWeb: RepresentedSafariCore.State
  }
  
  enum Action {
    case safariWeb(RepresentedSafariCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.safariWeb, action: \.safariWeb) {
      RepresentedSafariCore()
    }
    Reduce { state, action in
      switch action {
      case .safariWeb: break
      }
      
      return .none
    }
  }
}

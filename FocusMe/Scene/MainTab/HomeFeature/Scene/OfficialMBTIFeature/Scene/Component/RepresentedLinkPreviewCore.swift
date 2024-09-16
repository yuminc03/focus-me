import LinkPresentation

import ComposableArchitecture

@Reducer
struct RepresentedLinkPreviewCore {
  @ObservableState
  struct State: Equatable {
    let url: String
    var metadata = LPLinkMetadata()
  }
  
  enum Action {
    case setMetadata(LPLinkMetadata)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case let .setMetadata(metadata):
        state.metadata = metadata
      }
      
      return .none
    }
  }
}

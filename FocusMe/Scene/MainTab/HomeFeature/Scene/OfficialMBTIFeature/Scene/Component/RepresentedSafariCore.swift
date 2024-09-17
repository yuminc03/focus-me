import Foundation

import ComposableArchitecture

@Reducer
struct RepresentedSafariCore {
  struct State: Equatable {
    let url: String
  }
  
  enum Action { }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}


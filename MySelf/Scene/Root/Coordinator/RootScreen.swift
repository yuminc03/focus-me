//
//  RootScreen.swift
//  MySelf
//
//  Created by Yumin Chu on 2/18/24.
//

import Foundation

import ComposableArchitecture

struct RootScreen: Reducer {
  enum State: Equatable, Identifiable {
    case root(RootCore.State)
    
    var id: UUID {
      switch self {
      case let .root(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case root(RootCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: /State.root, action: /Action.root) {
      RootCore()
    }
  }
}

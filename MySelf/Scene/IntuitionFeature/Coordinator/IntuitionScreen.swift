//
//  IntuitionScreen.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import Foundation

import ComposableArchitecture

struct IntuitionScreen: Reducer {
  enum State: Equatable, Identifiable {
    case intro(IntuitionIntroCore.State)
    
    var id: UUID {
      switch self {
      case let .intro(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case intro(IntuitionIntroCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: /State.intro, action: /Action.intro) {
      IntuitionIntroCore()
    }
  }
}

//
//  FeelingScreen.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import Foundation

import ComposableArchitecture

struct FeelingScreen: Reducer {
  enum State: Equatable, Identifiable {
    case intro(FeelingIntroCore.State)
    
    var id: UUID {
      switch self {
      case let .intro(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case intro(FeelingIntroCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: /State.intro, action: /Action.intro) {
      FeelingIntroCore()
    }
  }
}

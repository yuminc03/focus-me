//
//  IntrovertScreen.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import Foundation

import ComposableArchitecture

struct IntrovertScreen: Reducer {
  enum State: Equatable, Identifiable {
    case intro(IntrovertIntroCore.State)
    
    var id: UUID {
      switch self {
      case let .intro(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case intro(IntrovertIntroCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: /State.intro, action: /Action.intro) {
      IntrovertIntroCore()
    }
  }
}

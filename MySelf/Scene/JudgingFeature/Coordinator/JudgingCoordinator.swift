//
//  JudgingCoordinator.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct JudgingCoordinator: Reducer {
  struct State: Equatable, IdentifiedRouterState {
    static let initialState = State(
      routes: [.root(.intro(.init()), embedInNavigationView: true)]
    )
    var routes: IdentifiedArrayOf<Route<JudgingScreen.State>>
  }
  
  enum Action: IdentifiedRouterAction {
    case routeAction(JudgingScreen.State.ID, action: JudgingScreen.Action)
    case updateRoutes(IdentifiedArrayOf<Route<JudgingScreen.State>>)
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      default:
        break
      }
      
      return .none
    }
  }
}

struct JudgingCoordinatorView: View {
  private let store: StoreOf<JudgingCoordinator>
  
  init(store: StoreOf<JudgingCoordinator>) {
    self.store = store
  }
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .intro:
          CaseLet(
            /JudgingScreen.State.intro,
             action: JudgingScreen.Action.intro,
             then: JudgingIntroView.init
          )
        }
      }
    }
  }
}

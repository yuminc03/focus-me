//
//  IntrovertCoordinator.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct IntrovertCoordinator: Reducer {
  struct State: Equatable, IdentifiedRouterState {
    static let initialState = State(
      routes: [.root(.intro(.init()), embedInNavigationView: true)]
    )
    var routes: IdentifiedArrayOf<Route<IntrovertScreen.State>>
  }
  
  enum Action: IdentifiedRouterAction {
    case routeAction(IntrovertScreen.State.ID, action: IntrovertScreen.Action)
    case updateRoutes(IdentifiedArrayOf<Route<IntrovertScreen.State>>)
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

struct IntrovertCoordinatorView: View {
  private let store: StoreOf<IntrovertCoordinator>
  
  init(store: StoreOf<IntrovertCoordinator>) {
    self.store = store
  }
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .intro:
          CaseLet(
            /IntrovertScreen.State.intro,
             action: IntrovertScreen.Action.intro,
             then: IntrovertIntroView.init
          )
        }
      }
    }
  }
}

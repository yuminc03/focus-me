//
//  RootCoordinator.swift
//  MySelf
//
//  Created by Yumin Chu on 2/18/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct RootCoordinator: Reducer {
  struct State: Equatable, IdentifiedRouterState {
    static let initialState = State(
      routes: [.root(.root(.init()), embedInNavigationView: true)]
    )
    var routes: IdentifiedArrayOf<Route<RootScreen.State>>
  }
  
  enum Action: IdentifiedRouterAction {
    case routeAction(RootScreen.State.ID, action: RootScreen.Action)
    case updateRoutes(IdentifiedArrayOf<Route<RootScreen.State>>)
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

struct RootCoordinatorView: View {
  private let store: StoreOf<RootCoordinator>
  
  init(store: StoreOf<RootCoordinator>) {
    self.store = store
  }
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .root:
          CaseLet(
            /RootScreen.State.root,
            action: RootScreen.Action.root,
            then: RootView.init
          )
        }
      }
    }
  }
}

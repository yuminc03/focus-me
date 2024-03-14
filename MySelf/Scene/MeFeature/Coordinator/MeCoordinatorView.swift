//
//  MeCoordinatorView.swift
//  MySelf
//
//  Created by Yumin Chu on 2/18/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct MeCoordinator: Reducer {
  struct State: Equatable, IdentifiedRouterState {
    static let initialState = State(
      routes: [.root(.root(.init()), embedInNavigationView: true)]
    )
    var routes: IdentifiedArrayOf<Route<MeScreen.State>>
  }
  
  enum Action: IdentifiedRouterAction {
    case routeAction(MeScreen.State.ID, action: MeScreen.Action)
    case updateRoutes(IdentifiedArrayOf<Route<MeScreen.State>>)
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

struct MeCoordinatorView: View {
  private let store: StoreOf<MeCoordinator>
  
  init(store: StoreOf<MeCoordinator>) {
    self.store = store
  }
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .root:
          CaseLet(
            /MeScreen.State.root,
            action: MeScreen.Action.root,
            then: RootView.init
          )
        }
      }
    }
  }
}

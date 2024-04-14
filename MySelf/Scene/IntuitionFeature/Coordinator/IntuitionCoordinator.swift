//
//  IntuitionCoordinator.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct IntuitionCoordinator: Reducer {
  struct State: Equatable, IdentifiedRouterState {
    static let initialState = State(
      routes: [.root(.intro(.init()), embedInNavigationView: true)]
    )
    var routes: IdentifiedArrayOf<Route<IntuitionScreen.State>>
  }
  
  enum Action: IdentifiedRouterAction {
    case routeAction(IntuitionScreen.State.ID, action: IntuitionScreen.Action)
    case updateRoutes(IdentifiedArrayOf<Route<IntuitionScreen.State>>)
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

struct IntuitionCoordinatorView: View {
  private let store: StoreOf<IntuitionCoordinator>
  
  init(store: StoreOf<IntuitionCoordinator>) {
    self.store = store
  }
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .intro:
          CaseLet(
            /IntuitionScreen.State.intro,
             action: IntuitionScreen.Action.intro,
             then: IntuitionIntroView.init
          )
        }
      }
    }
  }
}

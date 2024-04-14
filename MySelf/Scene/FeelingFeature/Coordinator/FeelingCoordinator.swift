//
//  FeelingCoordinator.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct FeelingCoordinator: Reducer {
  struct State: Equatable, IdentifiedRouterState {
    static let initialState = State(
      routes: [.root(.intro(.init()), embedInNavigationView: true)]
    )
    var routes: IdentifiedArrayOf<Route<FeelingScreen.State>>
  }
  
  enum Action: IdentifiedRouterAction {
    case routeAction(FeelingScreen.State.ID, action: FeelingScreen.Action)
    case updateRoutes(IdentifiedArrayOf<Route<FeelingScreen.State>>)
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

struct FeelingCoordinatorView: View {
  private let store: StoreOf<FeelingCoordinator>
  
  init(store: StoreOf<FeelingCoordinator>) {
    self.store = store
  }
  
  var body: some View {
    TCARouter(store) { screen in
      SwitchStore(screen) { screen in
        switch screen {
        case .intro:
          CaseLet(
            /FeelingScreen.State.intro,
             action: FeelingScreen.Action.intro,
             then: FeelingIntroView.init
          )
        }
      }
    }
  }
}

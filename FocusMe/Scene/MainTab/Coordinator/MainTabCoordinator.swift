import SwiftUI

import TCACoordinators
import ComposableArchitecture

@Reducer
struct MainTabCoordinator {
  struct State: Equatable {
    static let initialState = State(
      home: .initialState,
      myInfo: .initialState,
      selectedTab: .home
    )
    
    var home: HomeCoordinator.State
    var myInfo: MyInfoCoordinator.State
    
    var selectedTab: Tab
  }
  
  enum Tab: Hashable {
    case home
    case myInfo
  }
  
  enum Action {
    case home(HomeCoordinator.Action)
    case myInfo(MyInfoCoordinator.Action)
    
    case selectTab(Tab)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.home, action: \.home) {
      HomeCoordinator()
    }
    Scope(state: \.myInfo, action: \.myInfo) {
      MyInfoCoordinator()
    }
    Reduce { state, action in
      return .none
    }
  }
}

struct MainTabCoordinatorView: View {
  let store: StoreOf<MainTabCoordinator>
  
  var body: some View {
    WithViewStore(store, observe: \.selectedTab) { viewStore in
      TabView(selection: viewStore.binding(
        get: { $0 },
        send: MainTabCoordinator.Action.selectTab)
      ) {
        
      }
    }
  }
}

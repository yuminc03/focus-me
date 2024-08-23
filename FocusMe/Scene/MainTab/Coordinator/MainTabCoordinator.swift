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
      switch action {
      case .home: break
      case .myInfo: break
      case let .selectTab(tab):
        state.selectedTab = tab
      }
      
      return .none
    }
  }
}

struct MainTabCoordinatorView: View {
  @EnvironmentObject private var stateManager: StateManager

  let store: StoreOf<MainTabCoordinator>
  
  var body: some View {
    WithViewStore(store, observe: \.selectedTab) { viewStore in
      ZStack(alignment: .bottom) {
        TabView(selection: viewStore.binding(
          get: { $0 },
          send: MainTabCoordinator.Action.selectTab)
        ) {
          HomeCoordinatorView(store: store.scope(state: \.home, action: \.home))
            .tag(MainTabCoordinator.Tab.home)
            .tabItem {
              Label("홈", systemImage: .systemImage(.house))
            }
            .toolbar(.hidden, for: .tabBar)
          
          MyInfoCoordinatorView(store: store.scope(state: \.myInfo, action: \.myInfo))
            .tag(MainTabCoordinator.Tab.myInfo)
            .tabItem {
              Label("나의 정보", systemImage: .systemImage(.person))
            }
            .toolbar(.hidden, for: .tabBar)
        }
        
        if stateManager.isTabBarPresented {
          CustomTabBar
        }
      }
    }
  }
  
  var CustomTabBar: some View {
    WithViewStore(store, observe: { $0 }) { viewStore in
      HStack {
        Spacer()

        Button {
          store.send(.selectTab(.home))
        } label: {
          VStack(spacing: 5) {
            Image(systemName: .systemImage(.house))
              .size(30)
            Text("홈")
              .customFont(size: 10)
          }
          .foregroundColor(viewStore.selectedTab == .home ? .deepPurple : .lavender)
        }
        
        Spacer()
        
        Button {
          store.send(.selectTab(.myInfo))
        } label: {
          VStack(spacing: 5) {
            Image(systemName: .systemImage(.person))
              .size(30)
            Text("내 정보")
              .customFont(size: 10)
          }
          .foregroundColor(viewStore.selectedTab == .myInfo ? .deepPurple : .lavender)
        }
        
        Spacer()
      }
      .padding(.vertical, 20)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(.thinMaterial)
          .shadow(color: .black.opacity(0.3), radius: 10)
      )
      .padding(.horizontal, 20)
    }
  }
}

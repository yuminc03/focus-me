import SwiftUI

import ComposableArchitecture

struct AppView: View {
  @Perception.Bindable private var store: StoreOf<AppCore>
  
  @StateObject private var stateManager = StateManager()
  
  init(store: StoreOf<AppCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack {
        switch store.appState {
        case .splash:
          Splash
          
        case .login:
          LoginCoordinatorView(store: store.scope(state: \.login, action: \.login))
            .environmentObject(stateManager)
            .onAppear {
              NotiManager.post(key: .hideTab)
            }
          
        case .main:
          MainTabCoordinatorView(store: store.scope(state: \.main, action: \.main))
            .environmentObject(stateManager)
            .onAppear {
              NotiManager.post(key: .showTab)
            }
        }
      }
      .onReceive(NotiManager.publisher(key: .logout)) { _ in
        UserInfo.shared.clear()
        UDStorage.logout()
        store.send(._setAppState(.login))
      }
      .onReceive(store.publisher.appState) {
        if $0 == .splash {
          store.send(._getCurrentUser)
        }
      }
    }
  }
}

private extension AppView {
  var Splash: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
      
      Image(.dreamCatcher)
        .resizable()
        .frame(width: 180, height: 360)
    }
  }
}

#Preview {
  AppView(store: .init(initialState: .initialState) {
    AppCore()
  })
}

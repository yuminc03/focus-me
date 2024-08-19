import SwiftUI

import ComposableArchitecture

struct AppView: View {
  @Perception.Bindable private var store: StoreOf<AppCore>
  
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
          
        case .main:
          MainTabCoordinatorView(store: store.scope(state: \.main, action: \.main))
        }
      }
      .onAppear {
        store.send(._onAppear)
      }
    }
  }
}

private extension AppView {
  var Splash: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
    }
  }
}

#Preview {
  AppView(store: .init(initialState: .initialState) {
    AppCore()
  })
}

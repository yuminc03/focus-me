import SwiftUI

struct AppView: View {
  @StateObject private var vm = AppVM()
  @StateObject private var coordinator = Coordinator()
  
  var body: some View {
    VStack {
      switch vm.appState {
      case .splash:
        Splash
        
      case .login:
        Login
        
      case .home:
        Home
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
  
  var Home: some View {
    NavigationStack(path: $coordinator.route) {
      HomeView()
        .navigationDestination(for: Destination.self) { screen in
          screen.view
        }
    }
    .environmentObject(coordinator)
  }
  
  var Login: some View {
    NavigationStack(path: $coordinator.route) {
      LoginView()
        .navigationDestination(for: Destination.self) { screen in
          screen.view
            .environmentObject(vm)
        }
    }
    .environmentObject(coordinator)
  }
}

#Preview {
  AppView()
}

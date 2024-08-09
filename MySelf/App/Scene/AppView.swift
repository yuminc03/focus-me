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
    .onAppear {
      vm.getLoginUser()
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
      ZStack {
        Color.blue
          .ignoresSafeArea()
      }
      .environmentObject(coordinator)
      .navigationDestination(for: Destination.self) { _ in
        
      }
    }
  }
  
  var Login: some View {
    NavigationStack(path: $coordinator.route) {
      LoginView()
        .environmentObject(coordinator)
        .navigationDestination(for: Destination.self) { _ in
          
        }
    }
  }
}

#Preview {
  AppView()
}

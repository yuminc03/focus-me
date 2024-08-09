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
      .navigationDestination(for: Destination.self) { _ in
        
      }
    }
    .environmentObject(coordinator)
  }
  
  var Login: some View {
    NavigationStack(path: $coordinator.route) {
      LoginView()
        .navigationDestination(for: Destination.self) { screen in
          switch screen {
          case .login:
            LoginView()
              .environmentObject(coordinator)
            
          case .signup:
            SignUpView()
              .environmentObject(coordinator)
          }
        }
    }
    .environmentObject(coordinator)
  }
}

#Preview {
  AppView()
}

import Foundation
import Combine

@MainActor
final class AppVM: ObservableObject {
  enum AppState {
    case splash
    case login
    case home
  }

  @Published private(set) var appState: AppState = .splash
  
  func getLoginUser() {
    Task {
      do {
        try await AuthenticationService.shared.getCurrentUser()
        appState = .home
      } catch {
        appState = .login
      }
    }
  }
}

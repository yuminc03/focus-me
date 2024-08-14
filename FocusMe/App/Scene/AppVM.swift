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
  
  init() {
    self.getLoginUser()
  }
  
  private func getLoginUser() {
    Task {
      do {
        try await AuthenticationService.shared.getCurrentUser()
        appState = .home
      } catch {
        appState = .login
      }
    }
  }
  
  func setAppState(_ appState: AppState) {
    self.appState = appState
  }
}

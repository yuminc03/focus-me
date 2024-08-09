import Foundation
import Combine

final class AppVM: ObservableObject {
  enum AppState {
    case splash
    case login
    case home
  }

  @Published private(set) var appState: AppState = .splash
  
  func getLoginUser() {
    do {
      try AuthenticationService.shared.getCurrentUser()
      self.appState = .home
    } catch {
      print(error.localizedDescription)
      self.appState = .login
    }
  }
}

import Foundation
import Combine

@MainActor
final class LoginVM: ObservableObject {
  private(set) var loginError: String?
  @Published var isLoginErrorPresented = false
  
  func login(email: String, password: String) {
    Task {
      do {
        try await AuthenticationService.shared.login(entity: .init(email: email, password: password))
        loginError = nil
      } catch {
        guard let authError = error as? FMError else {
          print("알 수 없는 오류")
          return
        }
        
        isLoginErrorPresented = true
        switch authError {
        case let .login(reason):
          loginError = reason.message
          
        default:
          loginError = "로그인에 실패했습니다.\n다시 시도해주세요."
        }
      }
    }
  }
}

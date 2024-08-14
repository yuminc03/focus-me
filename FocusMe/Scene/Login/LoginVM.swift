import Foundation
import Combine

@MainActor
final class LoginVM: ObservableObject {
  @Published var isLoginErrorPresented = false
  @Published var isLoading = false
  @Published var isCompleteLogin = false
  
  private(set) var loginError: String?

  func login(email: String, password: String) {
    isLoading = true
    Task {
      do {
        try await AuthenticationService.shared.login(entity: .init(email: email, password: password))
        loginError = nil
        isLoading = false
        isCompleteLogin = true
      } catch {
        isLoading = false
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

import Foundation
import Combine

final class LoginVM: ObservableObject {
  
  func login(email: String, password: String) {
    Task {
      do {
        try await AuthenticationService.shared.login(entity: .init(email: email, password: password))
        print("로그인 성공!")
      } catch {
        print("로그인에 실패함")
      }
    }
  }
}

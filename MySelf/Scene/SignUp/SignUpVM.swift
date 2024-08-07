import Foundation
import Combine

final class SignUpVM: ObservableObject {
  @Published private(set) var confirmPasswordError = ""
  @Published private(set) var password = ""
  @Published private(set) var confirmPassword = ""
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    bind()
  }
  
  private func bind() {
    $password
      .combineLatest($confirmPassword)
      .sink { [weak self] in
        guard $0 != $1 else {
          self?.confirmPasswordError = ""
          return
        }
        
        self?.confirmPasswordError = "입력한 비밀번호와 같게 입력해주세요"
      }
      .store(in: &cancelBag)
  }
  
  func signup(email: String, password: String, name: String) {
    
  }
  
  func changeConfirmPassword(password: String, confirmPassword: String) -> String {
    self.password = password
    self.confirmPassword = confirmPassword
    return confirmPasswordError
  }
}

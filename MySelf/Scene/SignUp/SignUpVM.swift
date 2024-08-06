import Foundation
import Combine

final class SignUpVM: ObservableObject {
  private(set) var confirmPasswordError = ""
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    bind()
  }
  
  private func bind() {
    
  }
  
  func signup(email: String, password: String, name: String) {
    
  }
}

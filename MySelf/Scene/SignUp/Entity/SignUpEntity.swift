import Foundation

/// 회원가입 시 사용됨
struct SignUpEntity: Encodable {
  let id: String
  let email: String
  let password: String
  let name: String
  
  init(email: String, password: String, name: String) {
    self.id = UUID().uuidString
    self.email = email
    self.password = password
    self.name = name
  }
}

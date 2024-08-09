import Foundation

final class UserInfo {
  static let shared = UserInfo()
  
  var email: String?
  var name: String?
  
  private init() { }
  
  func save(email: String?, name: String?) {
    self.email = email
    self.name = name
  }
  
  func logout() {
    email = nil
    name = nil
  }
}

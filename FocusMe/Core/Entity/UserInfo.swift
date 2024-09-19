import Foundation

final class UserInfo {
  static let shared = UserInfo()
  
  var uid: String?
  var email: String?
  var name: String?
  
  private init() { }
  
  func save(email: String?, name: String?) {
    self.email = email
    self.name = name
  }
  
  func clear() {
    uid = nil
    email = nil
    name = nil
  }
}

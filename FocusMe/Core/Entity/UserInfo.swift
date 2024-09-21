import Foundation

final class UserInfo {
  static let shared = UserInfo()
  
  var uid: String?
  
  private init() { }
  
  func clear() {
    uid = nil
  }
}

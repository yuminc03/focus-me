import Foundation

/// 로그인 시 사용됨
struct LoginEntity: Encodable {
  let email: String
  let password: String
}

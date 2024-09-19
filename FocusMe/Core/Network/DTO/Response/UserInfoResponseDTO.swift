import Foundation

/// 로그인 시 받을 사용자의 정보
struct UserInfoResponseDTO: Decodable {
  let email: String
  let name: String
}

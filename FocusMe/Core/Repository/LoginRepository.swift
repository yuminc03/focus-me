import Foundation

import FirebaseFirestore

final class LoginRepository {
  /// 로그인 후 사용자 정보 저장
  func login(target: CollectionTarget) async throws {
    let document = Firestore.firestore().collection(target.collection.rawValue).document(target.documentID)
    let dto = try await document.getDocument(as: UserInfoResponseDTO.self)
    UDStorage.email = dto.email
    UDStorage.name = dto.name
  }
}

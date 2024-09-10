import Foundation

import FirebaseFirestore

final class SignUpRepository {
  /// 회원가입
  func signup(target: CollectionTarget) async throws {
    let collection = Firestore.firestore().collection(target.collection.rawValue).document(target.documentID)
    
    return try await withCheckedThrowingContinuation { continuation in
      do {
        try collection.setData(from: target.data) { error in
          if let error {
            continuation.resume(with: .failure(FMError.signup(.unknown(error.localizedDescription))))
          } else {
            continuation.resume(with: .success(()))
          }
        }
      } catch {
        continuation.resume(with: .failure(FMError.signup(.unknown(error.localizedDescription))))
      }
    }
  }
}

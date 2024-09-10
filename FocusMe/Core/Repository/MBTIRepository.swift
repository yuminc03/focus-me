import Foundation

import FirebaseFirestore

final class MBTIRepository {
  /// MBTI 테스트 결과 저장
  func saveMBTIResult(target: CollectionTarget) async throws {
    let collection = Firestore.firestore().collection(target.collection.rawValue).document(target.documentID)
    return try await withCheckedThrowingContinuation { continuation in
      do {
        try collection.setData(from: target.data) { error in
          if let error {
            continuation.resume(with: .failure(FMError.mbti(.unknown(error.localizedDescription))))
          } else {
            continuation.resume(with: .success(()))
          }
        }
      } catch {
        continuation.resume(with: .failure(FMError.unknown(error.localizedDescription)))
      }
    }
  }
}

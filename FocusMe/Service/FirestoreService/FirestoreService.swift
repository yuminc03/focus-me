import FirebaseFirestore
import ComposableArchitecture

final class FirestoreService {
  static let shared = FirestoreService()
  
  private init() { }
  
  /// 데이터를 저장할 때 사용
  func save(target: CollectionTarget) async throws {
    let collection = Firestore.firestore().collection(target.collection.rawValue).document(target.documentID)
    return try await withCheckedThrowingContinuation { continuation in
      do {
        try collection.setData(from: target.data) { error in
          if let error {
            print("회원가입 실패: \(error.localizedDescription)")
            continuation.resume(with: .failure(error))
          } else {
            print("회원가입 성공!")
            continuation.resume(with: .success(()))
          }
        }
      } catch {
        print("회원가입 실패: \(error.localizedDescription)")
        continuation.resume(with: .failure(error))
      }
    }
  }
}

struct FirestoreServiceKey: DependencyKey {
  static let liveValue = FirestoreService.shared
  static let previewValue = FirestoreService.shared
}

extension DependencyValues {
  var firestoreService: FirestoreService {
    get { self[FirestoreServiceKey.self] }
    set { self[FirestoreServiceKey.self] = newValue }
  }
}

import FirebaseFirestore
import ComposableArchitecture

final class FirestoreService {
  static let shared = FirestoreService()
  
  private let signUpRepo = SignUpRepository()
  
  private init() { }
  
  /// 데이터를 저장할 때 사용
  func save(target: CollectionTarget) async throws {
    let collection = Firestore.firestore().collection(target.collection.rawValue).document(target.documentID)
    switch target {
    case .signup:
      try await signUpRepo.signup(target: target, collection: collection)
      
    case .saveMBTIResult:
      break
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

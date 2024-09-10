import Foundation

import FirebaseFirestore

protocol FirestoreProtocol {
  var collection: CollectionTarget.Collection { get }
  var documentID: String { get }
  var data: Encodable { get }
}

enum CollectionTarget: FirestoreProtocol {
  /// 회원가입
  case signup(SignUpEntity)
  /// MBTI 검사결과 저장
  case saveMBTIResult(MBTITestResult)
}

extension CollectionTarget {
  enum Collection: String {
    case users = "Users"
    case mbtis = "MBTIs"
  }
  
  var collection: CollectionTarget.Collection {
    switch self {
    case .signup:
      return .users
      
    case .saveMBTIResult:
      return .mbtis
    }
  }
  
  var documentID: String {
    switch self {
    case let .signup(entity):
      return entity.id
      
    case let .saveMBTIResult(entity):
      return entity.id
    }
  }
  
  var data: Encodable {
    switch self {
    case let .signup(entity):
      return entity
      
    case let .saveMBTIResult(entity):
      return entity
    }
  }
}

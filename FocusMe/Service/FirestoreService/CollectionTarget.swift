import Foundation

protocol FirestoreProtocol {
  var collection: CollectionTarget.Collection { get }
  var documentID: String { get }
  var data: Encodable { get }
}

enum CollectionTarget: FirestoreProtocol {
  enum Collection: String {
    case users = "Users"
  }
  
  case signup(SignUpEntity)
}

extension CollectionTarget {
  var collection: CollectionTarget.Collection {
    switch self {
    case .signup:
      return .users
    }
  }
  
  var documentID: String {
    switch self {
    case let .signup(entity):
      return entity.id
    }
  }
  
  var data: Encodable {
    switch self {
    case let .signup(entity):
      return entity
    }
  }
}

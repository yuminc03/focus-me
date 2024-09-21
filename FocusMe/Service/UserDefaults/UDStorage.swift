import Foundation

@propertyWrapper
struct UD<T: Codable> {
  private let key: UDKey
  
  init(key: UDKey) {
    self.key = key
  }
  
  var wrappedValue: T? {
    get {
      switch T.self {
      case is Data.Type:
        guard let object = UserDefaults.standard.object(forKey: key.rawValue) as? Data,
              let decoded = try? JSONDecoder().decode(T.self, from: object)
        else { return nil }
        return decoded
        
      default:
        return UserDefaults.standard.value(forKey: key.rawValue) as? T
      }
    }
    set {
      switch T.self {
      case is Data.Type:
        guard let encoded = try? JSONEncoder().encode(newValue) else { return }
        UserDefaults.standard.setValue(encoded, forKey: key.rawValue)
        
      default:
        UserDefaults.standard.setValue(newValue, forKey: key.rawValue)
      }
    }
  }
}

enum UDKey: String {
  case email
  case name
}

enum UDStorage {
  @UD(key: .email) static var email: String?
  @UD(key: .name) static var name: String?
  
  
  static func logout() {
    UDStorage.email = nil
    UDStorage.name = nil
  }
}

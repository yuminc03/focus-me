import Foundation

extension Encodable {
  var toDictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self),
          let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
    else {
      return nil
    }
    
    return dictionary
  }
}

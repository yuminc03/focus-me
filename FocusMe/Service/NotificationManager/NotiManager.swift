import Foundation
import Combine

enum NotificationKey: String {
  case hideTab
  case showTab
  
  var name: Notification.Name {
    return .init(self.rawValue)
  }
}

enum NotiManager {
  static func publisher(
    key: NotificationKey,
    on schedular: some Scheduler = DispatchQueue.main
  ) -> AnyPublisher<[AnyHashable: Any]?, Never> {
    NotificationCenter.default.publisher(for: key.name)
      .receive(on: schedular)
      .map(\.userInfo)
      .eraseToAnyPublisher()
  }
  
  static func post(key: NotificationKey, userInfo: [AnyHashable: Any]? = nil) {
    NotificationCenter.default.post(name: key.name, object: nil, userInfo: userInfo)
  }
}

import Foundation

/// 파티 준비
enum MyWayPartying: Answer {
  case now
  case later
  
  var title: String {
    switch self {
    case .now:
      return "인원수에 맞춰서 메뉴와 음식양을 미리 정한다."
    case .later:
      return "친구들이 오면 그 때 정하고 주문한다."
    }
  }
}

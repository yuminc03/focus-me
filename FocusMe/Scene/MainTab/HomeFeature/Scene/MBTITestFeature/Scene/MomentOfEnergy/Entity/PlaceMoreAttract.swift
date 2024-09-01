import Foundation

/// 더 끌리는 장소
enum PlaceMoreAttract: Answer {
  case serendipity
  case scheduled
  
  var title: String {
    switch self {
    case .serendipity:
      return "우연히 갔던 맛집"
    case .scheduled:
      return "미리 예약한 레스토랑"
    }
  }
}

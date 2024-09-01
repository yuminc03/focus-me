import Foundation

/// 여행을 왔을 때 더 좋아하는 숙소
enum FavoriteHotel: Answer {
  case friends
  case group
  
  var title: String {
    switch self {
    case .friends:
      return "여행을 함께온 친구랑만 조용히 쉴 수 있는 숙소"
    case .group:
      return "여러 사람들이 모여 파티를 할 수 있는 숙소"
    }
  }
}

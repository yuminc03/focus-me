import Foundation

/// 더 좋아하는 여행
enum FavoriteTrip: Answer {
  case together
  case alone
  
  var title: String {
    switch self {
    case .together:
      return "여러명이 함께 가는 어행"
    case .alone:
      return "혼자 또는 2명 정도 소수로 함께 가는 여행"
    }
  }
}

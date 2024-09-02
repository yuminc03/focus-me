import Foundation

/// 사람이 많은 곳에 왔을 때 기분
enum FeelWhenCrowded: Answer {
  case excited
  case energized
  
  var title: String {
    switch self {
    case .excited:
      return "여기 핫플레이스 맞네. 제대로 왔당!"
    case .energized:
      return "기 빨린다… 사람이 좀 빠지면 좋겠는데.."
    }
  }
}

import Foundation

/// 자신을 더 설레게 하는 상황
enum SituationMoreExcited: Answer {
  case unfamiliar
  case planned
  
  var title: String {
    switch self {
    case .unfamiliar:
      return "낯선 곳에서 즐거운 경험들이 쌓였을 때"
    case .planned:
      return "계획한대로 모든 일이 맞아 떨어질 때"
    }
  }
}

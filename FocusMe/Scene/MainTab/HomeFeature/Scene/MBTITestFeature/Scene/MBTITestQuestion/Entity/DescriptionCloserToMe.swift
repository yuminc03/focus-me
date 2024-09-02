import Foundation

/// 일상 속에서 자신과 더 가까운 설명
enum DescriptionCloserToMe: Answer {
  case consistent
  case change
  
  var title: String {
    switch self {
    case .consistent:
      return "일관성을 중요시한다."
    case .change:
      return "변화를 즐기고 새로운 시도를 한다."
    }
  }
}

import Foundation

/// 염색을 했는데 안 어울린다면 해주는 말
enum WhenDontLinkHairColor: Answer {
  case honest
  case reflecting
  
  var title: String {
    switch self {
    case .honest:
      return "다른 색이 잘 어울린다고 솔직하게 얘기해준다."
    case .reflecting:
      return "안 어울려도 잘 어울린다고 말해준다."
    }
  }
}

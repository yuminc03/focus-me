import Foundation

/// 친구와 싸우게 되었을 때 기분이 풀리는 말
enum HowToFeelBetter: Answer {
  case sorry
  case trying
  
  var title: String {
    switch self {
    case .sorry:
      return "속상하게 해서 미안해. 니 마음을 이해하지 못했어."
    case .trying:
      return "이 부분은 내가 잘못했어. 앞으로 그러지 않도록 노력할게."
    }
  }
}

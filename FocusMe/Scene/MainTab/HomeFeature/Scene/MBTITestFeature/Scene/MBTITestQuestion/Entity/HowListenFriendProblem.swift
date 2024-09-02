import Foundation

/// 친구가 회사에서 혼났다고 털어놓으면 해줄 말
enum HowListenFriendProblem: Answer {
  case reason
  case consolation
  
  var title: String {
    switch self {
    case .reason:
      return "뭐 때문에 혼났어?"
    case .consolation:
      return "많이 속상하겠다.. 괜찮아?"
    }
  }
}

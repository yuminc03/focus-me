import Foundation

/// 친구가 나에게 고민을 털어놓았을 때  반응
enum ReactionToWorry: Answer {
  case offeringSolution
  case empathize
  
  var title: String {
    switch self {
    case .offeringSolution:
      return "다양한 관점으로 해결책을 제시하고 설명해준다."
    case .empathize:
      return "친구의 말을 들어주고 공감을 해준다."
    }
  }
}

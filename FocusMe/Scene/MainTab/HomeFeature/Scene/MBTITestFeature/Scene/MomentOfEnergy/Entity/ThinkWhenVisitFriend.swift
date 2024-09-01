import Foundation

/// 친구를 만나러 갈 때 드는 생각
enum ThinkWhenVisitFriend: Answer {
  case imagine
  case calculateTime
  
  var title: String {
    switch self {
    case .imagine:
      return "창밖 풍경을 바라보며 모험을 상상한다."
    case .calculateTime:
      return "몇 정거장 후에 내릴 지 계산한다."
    }
  }
}

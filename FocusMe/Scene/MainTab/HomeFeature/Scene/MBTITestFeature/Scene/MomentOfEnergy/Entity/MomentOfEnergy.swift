import Foundation

/// 에너지를 얻는 순간
enum MomentOfEnergy: Answer {
  case together
  case alone
  
  var title: String {
    switch self {
    case .together:
      return "사람들과 함께 시간을 보낼 때"
    case .alone:
      return "혼자만의 시간을 보낼 때"
    }
  }
}

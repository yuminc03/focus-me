import Foundation

/// 털 색깔이 특이하고 신기한 고양이를 본다면 드는 생각
enum ThinkWhenInterestingCat: Answer {
  case curiosity
  case feelingLucky
  
  var title: String {
    switch self {
    case .curiosity:
      return "오~! 이 고양이는 털이 신기하고 특이하다."
    case .feelingLucky:
      return "행운의 고양이인가? 오늘 좋은 일이 생길 것 같아!"
    }
  }
}

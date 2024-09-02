import Foundation

/// 휴일을 보내는 방법
enum TakeHoliday: Answer {
  case rest
  case meeting
  
  var title: String {
    switch self {
    case .rest:
      return "혼자서 보내는 온전한 휴식"
    case .meeting:
      return "사랑하는 사람들과의 만남"
    }
  }
}

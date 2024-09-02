import Foundation

/// 레트로 감성 카메라 찾았다면 드는 생각
enum ThinkWhenFindRetroCamera: Answer {
  case verifying
  case imagining
  
  var title: String {
    switch self {
    case .verifying:
      return "지금도 작동이 되는지 살펴본다."
    case .imagining:
      return "과거로 시간 여행을 떠나는 상상을 한다."
    }
  }
}

import Foundation

/// 더 기분 좋은 칭찬
enum NiceCompliment: Answer {
  case resolved
  case warmPerson
  
  var title: String {
    switch self {
    case .resolved:
      return "네 덕분에 금방 일이 해결되었어."
    case .warmPerson:
      return "넌 정말 따뜻한 사람이야!"
    }
  }
}

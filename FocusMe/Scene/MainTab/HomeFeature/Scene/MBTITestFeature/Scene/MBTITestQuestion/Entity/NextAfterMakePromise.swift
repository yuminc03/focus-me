import Foundation

/// 친구들과 약속을 잡았을 때 다음으로 하는 것
enum NextAfterMakePromise: Answer {
  case later
  case advance
  
  var title: String {
    switch self {
    case .later:
      return "그 때 가서 결정하자고 한다."
    case .advance:
      return "사전에 장소와 저녁 메뉴를 정한다."
    }
  }
}

import Foundation

/// 열린 결말 영화를 봤을 때 생각
enum ThinkWhenWatchingOpenEndedMovie: Answer {
  case imagineStory
  case findEnding
  
  var title: String {
    switch self {
    case .imagineStory:
      return "주인공이 되어서 결말 후에 스토리를 상상한다."
    case .findEnding:
      return "찜찜한 기분이 들어, 결말 해석을 찾아본다."
    }
  }
}

import Foundation

/// MBTI 테스트 질문
enum MBTIQuestion {
  case momentOfEnergy
  case takeHoliday
  case feelWhenCrowded
  case favoriteTrip
  case favoriteHotel
  case thinkWhenVisitFriend
  case thinkWhenInterestingCat
  case howToCook
  case thinkWhenFindRetroCamera
  case thinkWhenWatchingOpenEndedMovie
  case niceCompliment
  case reactionToWorry
  case howToFeelBetter
  case whenDontLinkHairColor
  case howListenFriendProblem
  case placeMoreAttract
  case situationMoreExcited
  case descriptionCloserToMe
  case nextAfterMakePromise
  case myWayPartying
  
  var title: String {
    switch self {
    case .momentOfEnergy:
      return "에너지를 얻는 순간이 언제인가요?"
    case .takeHoliday:
      return "휴일은 주로 어떻게 보내나요?"
    case .feelWhenCrowded:
      return "사람이 많은 곳에 왔을 때 기분은 어떤가요?"
    case .favoriteTrip:
      return "더 좋아하는 여행은 무엇인가요?"
    case .favoriteHotel:
      return "여행을 왔을 때 더 좋아하는 숙소는 어떤 곳인가요?"
    case .thinkWhenVisitFriend:
      return "친구를 만나러 갈 때 어떤 생각을 하나요?"
    case .thinkWhenInterestingCat:
      return "만약, 털 색깔이 특이하고 신기한 고양이를 본다면 어떤 생각이 드나요?"
    case .howToCook:
      return "요리를 할 때 어떻게 하는 편인가요?"
    case .thinkWhenFindRetroCamera:
      return "청소하다가 우연히 레트로 감성 카메라 찾았다면 드는 생각은 무엇인가요?"
    case .thinkWhenWatchingOpenEndedMovie:
      return "열린 결말 영화를 봤을 때 어떤가요?"
    case .niceCompliment:
      return "더 기분 좋은 칭찬이 무엇인가요?"
    case .reactionToWorry:
      return "친구가 나에게 고민을 털어놓으면 어떤 반응을 보이나요?"
    case .howToFeelBetter:
      return "친구와 싸우게 되었을 때 어떤 말에 기분이 풀리나요?"
    case .whenDontLinkHairColor:
      return "친구가 염색을 했는데 안 어울린다면 어떻게 얘기를 해주나요?"
    case .howListenFriendProblem:
      return "친구가 회사에서 혼났다고 털어놓으면 어떻게 얘기하나요?"
    case .placeMoreAttract:
      return "어떤 장소가 더 끌리나요?"
    case .situationMoreExcited:
      return "자신을 더 설레게 하는 상황은 무엇인가요?"
    case .descriptionCloserToMe:
      return "일상 속에서 자신과 더 가까운 설명은 무엇인가요?"
    case .nextAfterMakePromise:
      return "친구들과 약속을 잡았을 때 다음으로 하는 것은 무엇인가요?"
    case .myWayPartying:
      return "파티를 할 때 어떻게 하는 편인가요?"
    }
  }
}

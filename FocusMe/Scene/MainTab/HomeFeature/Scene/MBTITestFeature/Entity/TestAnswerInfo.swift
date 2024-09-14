import Foundation

import ComposableArchitecture

/// MBTI 테스트 점수
final class TestAnswerInfo {
  /// 에너지를 얻는 순간
  var momentOfEnergy: MomentOfEnergy?
  /// 휴일을 보내는 방법
  var takeHoliday: TakeHoliday?
  /// 사람이 많은 곳에 왔을 때 기분
  var feelWhenCrowded: FeelWhenCrowded?
  /// 더 좋아하는 여행
  var favoriteTrip: FavoriteTrip?
  /// 여행을 왔을 때 더 좋아하는 숙소
  var favoriteHotel: FavoriteHotel?
  
  /// 친구를 만나러 갈 때 드는 생각
  var thinkWhenVisitFriend: ThinkWhenVisitFriend?
  /// 털 색깔이 특이하고 신기한 고양이를 본다면 드는 생각
  var thinkWhenInterestingCat: ThinkWhenInterestingCat?
  /// 요리를 하는 방법
  var howToCook: HowToCook?
  /// 레트로 감성 카메라 찾았다면 드는 생각
  var thinkWhenFindRetroCamera: ThinkWhenFindRetroCamera?
  /// 열린 결말 영화를 봤을 때 생각
  var thinkWhenWatchingOpenEndedMovie: ThinkWhenWatchingOpenEndedMovie?
  
  /// 더 기분 좋은 칭찬
  var niceCompliment: NiceCompliment?
  /// 친구가 나에게 고민을 털어놓았을 때  반응
  var reactionToWorry: ReactionToWorry?
  /// 친구와 싸우게 되었을 때 기분이 풀리는 말
  var howToFeelBetter: HowToFeelBetter?
  /// 염색을 했는데 안 어울린다면 해주는 말
  var whenDontLinkHairColor: WhenDontLinkHairColor?
  /// 친구가 회사에서 혼났다고 털어놓으면 해줄 말
  var howListenFriendProblem: HowListenFriendProblem?
  
  /// 더 끌리는 장소
  var placeMoreAttract: PlaceMoreAttract?
  /// 자신을 더 설레게 하는 상황
  var situationMoreExcited: SituationMoreExcited?
  /// 일상 속에서 자신과 더 가까운 설명
  var descriptionCloserToMe: DescriptionCloserToMe?
  /// 친구들과 약속을 잡았을 때 다음으로 하는 것
  var nextAfterMakePromise: NextAfterMakePromise?
  /// 파티 준비
  var myWayPartying: MyWayPartying?
  
  /// 사용자의 MBTI
  var mbti: MBTI?
  
  static let shared = TestAnswerInfo()
  
  private init() { }
  
  func clear() {
    momentOfEnergy = nil
    takeHoliday = nil
    feelWhenCrowded = nil
    favoriteTrip = nil
    favoriteHotel = nil
    thinkWhenVisitFriend = nil
    thinkWhenInterestingCat = nil
    howToCook = nil
    thinkWhenFindRetroCamera = nil
    thinkWhenWatchingOpenEndedMovie = nil
    niceCompliment = nil
    reactionToWorry = nil
    howToFeelBetter = nil
    whenDontLinkHairColor = nil
    howListenFriendProblem = nil
    placeMoreAttract = nil
    situationMoreExcited = nil
    descriptionCloserToMe = nil
    nextAfterMakePromise = nil
    myWayPartying = nil
    mbti = nil
  }
}

extension TestAnswerInfo {
  /// E 점수
  var extraversionScore: Int {
    var score = 0
    
    if momentOfEnergy == .together {
      score += 1
    }
    
    if takeHoliday == .meeting {
      score += 1
    }
    
    if feelWhenCrowded == .excited {
      score += 1
    }
    
    if favoriteTrip == .together {
      score += 1
    }
    
    if favoriteHotel == .group {
      score += 1
    }
    
    return score
  }
  
  /// I 점수
  var introversionScore: Int {
    var score = 0
    
    if momentOfEnergy == .alone {
      score += 1
    }
    
    if takeHoliday == .rest {
      score += 1
    }
    
    if feelWhenCrowded == .energized {
      score += 1
    }
    
    if favoriteTrip == .alone {
      score += 1
    }
    
    if favoriteHotel == .friends {
      score += 1
    }
    
    return score
  }
  
  /// S 점수
  var sensingScore: Int {
    var score = 0
    
    if thinkWhenVisitFriend == .calculateTime {
      score += 1
    }
    
    if thinkWhenInterestingCat == .curiosity {
      score += 1
    }
    
    if howToCook == .checkRecipe {
      score += 1
    }
    
    if thinkWhenFindRetroCamera == .verifying {
      score += 1
    }
    
    if thinkWhenWatchingOpenEndedMovie == .findEnding {
      score += 1
    }
    
    return score
  }
  
  /// N 점수
  var intuitionScore: Int {
    var score = 0
    
    if thinkWhenVisitFriend == .imagine {
      score += 1
    }
    
    if thinkWhenInterestingCat == .feelingLucky {
      score += 1
    }
    
    if howToCook == .intuition {
      score += 1
    }
    
    if thinkWhenFindRetroCamera == .imagining {
      score += 1
    }
    
    if thinkWhenWatchingOpenEndedMovie == .imagineStory {
      score += 1
    }
    
    return score
  }
  
  /// T 점수
  var thinkingScore: Int {
    var score = 0
    
    if niceCompliment == .resolved {
      score += 1
    }
    
    if reactionToWorry == .offeringSolution {
      score += 1
    }
    
    if howToFeelBetter == .trying {
      score += 1
    }
    
    if whenDontLinkHairColor == .honest {
      score += 1
    }
    
    if howListenFriendProblem == .reason {
      score += 1
    }
    
    return score
  }
  
  /// F 점수
  var feelingScore: Int {
    var score = 0
    
    if niceCompliment == .warmPerson {
      score += 1
    }
    
    if reactionToWorry == .empathize {
      score += 1
    }
    
    if howToFeelBetter == .sorry {
      score += 1
    }
    
    if whenDontLinkHairColor == .reflecting {
      score += 1
    }
    
    if howListenFriendProblem == .consolation {
      score += 1
    }
    
    return score
  }
  
  /// J 점수
  var judgingScore: Int {
    var score = 0
    
    if placeMoreAttract == .scheduled {
      score += 1
    }
    
    if situationMoreExcited == .planned {
      score += 1
    }
    
    if descriptionCloserToMe == .consistent {
      score += 1
    }
    
    if nextAfterMakePromise == .advance {
      score += 1
    }
    
    if myWayPartying == .now {
      score += 1
    }
    
    return score
  }
  
  /// P 점수
  var perceivingScore: Int {
    var score = 0
    
    if placeMoreAttract == .serendipity {
      score += 1
    }
    
    if situationMoreExcited == .unfamiliar {
      score += 1
    }
    
    if descriptionCloserToMe == .change {
      score += 1
    }
    
    if nextAfterMakePromise == .later {
      score += 1
    }
    
    if myWayPartying == .later {
      score += 1
    }
    
    return score
  }
}

struct TestAnswerInfoKey: DependencyKey {
  static let liveValue = TestAnswerInfo.shared
  static let previewValue = TestAnswerInfo.shared
}

extension DependencyValues {
  var testAnswerInfo: TestAnswerInfo {
    get { self[TestAnswerInfoKey.self] }
    set { self[TestAnswerInfoKey.self] = newValue }
  }
}

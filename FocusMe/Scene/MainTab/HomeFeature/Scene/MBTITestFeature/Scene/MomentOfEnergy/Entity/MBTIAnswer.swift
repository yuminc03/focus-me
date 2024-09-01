import Foundation

enum MBTIAnswer {
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
  
  var selection: [MBTIAnswerEntity] {
    switch self {
    case .momentOfEnergy:
      return [
        .init(type: MomentOfEnergy.together),
        .init(type: MomentOfEnergy.alone),
      ]
      
    case .takeHoliday:
      return [
        .init(type: TakeHoliday.rest),
        .init(type: TakeHoliday.meeting),
      ]
      
    case .feelWhenCrowded:
      return [
        .init(type: FeelWhenCrowded.excited),
        .init(type: FeelWhenCrowded.energized),
      ]
      
    case .favoriteTrip:
      return [
        .init(type: FavoriteTrip.together),
        .init(type: FavoriteTrip.alone),
      ]
      
    case .favoriteHotel:
      return [
        .init(type: FavoriteHotel.friends),
        .init(type: FavoriteHotel.group),
      ]
      
    case .thinkWhenVisitFriend:
      return [
        .init(type: ThinkWhenVisitFriend.imagine),
        .init(type: ThinkWhenVisitFriend.calculateTime),
      ]
      
    case .thinkWhenInterestingCat:
      return [
        .init(type: ThinkWhenInterestingCat.curiosity),
        .init(type: ThinkWhenInterestingCat.feelingLucky),
      ]
      
    case .howToCook:
      return [
        .init(type: HowToCook.checkRecipe),
        .init(type: HowToCook.intuition),
      ]
      
    case .thinkWhenFindRetroCamera:
      return [
        .init(type: ThinkWhenFindRetroCamera.verifying),
        .init(type: ThinkWhenFindRetroCamera.imagining),
      ]
      
    case .thinkWhenWatchingOpenEndedMovie:
      return [
        .init(type: ThinkWhenWatchingOpenEndedMovie.imagineStory),
        .init(type: ThinkWhenWatchingOpenEndedMovie.findEnding),
      ]
      
    case .niceCompliment:
      return [
        .init(type: NiceCompliment.resolved),
        .init(type: NiceCompliment.warmPerson),
      ]
      
    case .reactionToWorry:
      return [
        .init(type: ReactionToWorry.offeringSolution),
        .init(type: ReactionToWorry.empathize),
      ]
      
    case .howToFeelBetter:
      return [
        .init(type: HowToFeelBetter.sorry),
        .init(type: HowToFeelBetter.trying),
      ]
      
    case .whenDontLinkHairColor:
      return  [
        .init(type: WhenDontLinkHairColor.honest),
        .init(type: WhenDontLinkHairColor.reflecting),
      ]
      
    case .howListenFriendProblem:
      return [
        .init(type: HowListenFriendProblem.reason),
        .init(type: HowListenFriendProblem.consolation),
      ]
      
    case .placeMoreAttract:
      return [
        .init(type: PlaceMoreAttract.serendipity),
        .init(type: PlaceMoreAttract.scheduled),
      ]
      
    case .situationMoreExcited:
      return [
        .init(type: SituationMoreExcited.unfamiliar),
        .init(type: SituationMoreExcited.planned),
      ]
      
    case .descriptionCloserToMe:
      return [
        .init(type: DescriptionCloserToMe.consistent),
        .init(type: DescriptionCloserToMe.change),
      ]
      
    case .nextAfterMakePromise:
      return [
        .init(type: NextAfterMakePromise.later),
        .init(type: NextAfterMakePromise.advance),
      ]
      
    case .myWayPartying:
      return [
        .init(type: MyWayPartying.now),
        .init(type: MyWayPartying.later),
      ]
    }
  }
}

import Foundation

import ComposableArchitecture

@Reducer
struct MBTITestQuestionCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    let question: MBTIQuestion
    var pastAnswers: [MBTIAnswerEntity]
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo
  @Dependency(\.mbtiTestStep) var mbtiTestStep
  
  enum Action {
    case delegate(Delegate)
    
    case tapBackButton
    case tapMomentButton(MBTIAnswerEntity)
    
    enum Delegate {
      case back
      case next(MBTIAnswerEntity)
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapMomentButton(answer):
        guard let index = state.pastAnswers.firstIndex(of: answer) else { return .none }
        
        for i in 0 ..< state.pastAnswers.count {
          state.pastAnswers[i].isSelected = false
        }
        
        state.pastAnswers[index].isSelected = true
        switch state.question {
        case .momentOfEnergy:
          testAnswerInfo.momentOfEnergy = index == 0 ? .together : .alone
          
        case .takeHoliday:
          testAnswerInfo.takeHoliday = index == 0 ? .rest : .meeting
          
        case .feelWhenCrowded:
          testAnswerInfo.feelWhenCrowded = index == 0 ? .excited : .energized
          
        case .favoriteTrip:
          testAnswerInfo.favoriteTrip = index == 0 ? .together : .alone
          
        case .favoriteHotel:
          testAnswerInfo.favoriteHotel = index == 0 ? .friends : .group
          
        case .thinkWhenVisitFriend:
          testAnswerInfo.thinkWhenVisitFriend = index == 0 ? .imagine : .calculateTime
          
        case .thinkWhenInterestingCat:
          testAnswerInfo.thinkWhenInterestingCat = index == 0 ? .curiosity : .feelingLucky
          
        case .howToCook:
          testAnswerInfo.howToCook = index == 0 ? .checkRecipe : .intuition
          
        case .thinkWhenFindRetroCamera:
          testAnswerInfo.thinkWhenFindRetroCamera = index == 0 ? .verifying : .imagining
          
        case .thinkWhenWatchingOpenEndedMovie:
          testAnswerInfo.thinkWhenWatchingOpenEndedMovie = index == 0 ? .imagineStory : .findEnding
          
        case .niceCompliment:
          testAnswerInfo.niceCompliment = index == 0 ? .resolved : .warmPerson
          
        case .reactionToWorry:
          testAnswerInfo.reactionToWorry = index == 0 ? .offeringSolution : .empathize
          
        case .howToFeelBetter:
          testAnswerInfo.howToFeelBetter = index == 0 ? .sorry : .trying
          
        case .whenDontLinkHairColor:
          testAnswerInfo.whenDontLinkHairColor = index == 0 ? .honest : .reflecting
          
        case .howListenFriendProblem:
          testAnswerInfo.howListenFriendProblem = index == 0 ? .reason : .consolation
          
        case .placeMoreAttract:
          testAnswerInfo.placeMoreAttract = index == 0 ? .serendipity : .scheduled
          
        case .situationMoreExcited:
          testAnswerInfo.situationMoreExcited = index == 0 ? .unfamiliar : .planned
          
        case .descriptionCloserToMe:
          testAnswerInfo.descriptionCloserToMe = index == 0 ? .consistent : .change
          
        case .nextAfterMakePromise:
          testAnswerInfo.nextAfterMakePromise = index == 0 ? .later : .advance
          
        case .myWayPartying:
          testAnswerInfo.myWayPartying = index == 0 ? .now : .later
        }
        
        return .send(.delegate(.next(state.pastAnswers[index])))
      }
      
      return .none
    }
  }
}


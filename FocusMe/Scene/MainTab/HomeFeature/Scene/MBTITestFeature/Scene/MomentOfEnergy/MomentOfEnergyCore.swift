import Foundation

import ComposableArchitecture

@Reducer
struct MomentOfEnergyCore {
  struct Moment: Equatable, Identifiable {
    let id = UUID()
    let title: String
    let type: MomentOfEnergy
    var isSelected = false
    
    static let all: [Moment] = [
      .init(title: "사람들과 함께 시간을 보낼 때", type: .together),
      .init(title: "혼자만의 시간을 보낼 때", type: .alone),
    ]
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var pastMoments = Moment.all
  }
  
  @Dependency(\.testAnswerInfo) var testAnswerInfo

  enum Action {
    case delegate(Delegate)
    
    case tapBackButton
    case tapMomentButton(Moment)
    
    enum Delegate {
      case back
      case next
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapMomentButton(moment):
        guard let index = state.pastMoments.firstIndex(of: moment) else { return .none }
        
        for i in 0 ..< state.pastMoments.count {
          state.pastMoments[i].isSelected = false
        }

        state.pastMoments[index].isSelected = true
        testAnswerInfo.momentOfEnergy = moment.type
        return .send(.delegate(.next))
      }
      
      return .none
    }
  }
}


import Foundation

import ComposableArchitecture

@Reducer
struct LoginSettingCore {
  struct SettingItem: Equatable, Identifiable {
    let id = UUID()
    let title: String
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    let items: [SettingItem] = [
      .init(title: "로그아웃")
    ]
  }
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    
    enum Delegate {
      case back
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
      }
      
      return .none
    }
  }
}

import Foundation

import ComposableArchitecture

@Reducer
struct LoginSettingCore {
  struct SettingItem: Equatable, Identifiable {
    let id = UUID()
    let type: LoginSetting
  }
  
  enum LoginSetting: String {
    case logout = "로그아웃"
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    let items: [SettingItem] = [
      .init(type: .logout)
    ]
  }
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    case tapListRow(LoginSetting)
    
    enum Delegate {
      case back
      case action(LoginSetting)
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapListRow(type):
        return .send(.delegate(.action(type)))
      }
      
      return .none
    }
  }
}

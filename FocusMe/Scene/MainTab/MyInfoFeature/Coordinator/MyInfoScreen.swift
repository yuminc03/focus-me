import SwiftUI

import ComposableArchitecture

@Reducer
struct MyInfoScreen {
  enum State: Equatable, Identifiable {
    case myInfo(MyInfoMainCore.State) // 내 정보 Main
    case loginSetting(LoginSettingCore.State) // 로그인 설정
    
    var id: UUID {
      switch self {
      case let .myInfo(state):
        return state.id
      case let .loginSetting(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case myInfo(MyInfoMainCore.Action)
    case loginSetting(LoginSettingCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.myInfo, action: \.myInfo) {
      MyInfoMainCore()
    }
    Scope(state: \.loginSetting, action: \.loginSetting) {
      LoginSettingCore()
    }
  }
}

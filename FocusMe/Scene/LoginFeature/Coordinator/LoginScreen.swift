import SwiftUI

import ComposableArchitecture

@Reducer
struct LoginScreen {
  enum State: Equatable, Identifiable {
    case login(LoginCore.State) // 로그인
    case signup(SignUpCore.State) // 회원가입
    
    var id: UUID {
      switch self {
      case let .login(state):
        return state.id
        
      case let .signup(state):
        return state.id
      }
    }
  }
  
  enum Action {
    case login(LoginCore.Action)
    case signup(SignUpCore.Action)
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.login, action: \.login) {
      LoginCore()
    }
    Scope(state: \.signup, action: \.signup) {
      SignUpCore()
    }
  }
}

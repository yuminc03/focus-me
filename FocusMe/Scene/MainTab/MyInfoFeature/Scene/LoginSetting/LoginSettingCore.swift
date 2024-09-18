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
  
  @Dependency(\.authenticationService) var authenticationService
  
  enum Action {
    case delegate(Delegate)
    case tapBackButton
    case tapListRow(LoginSetting)
    
    case _requestLogout
    case _logoutResponse(Result<Int, FMError>)
    
    enum Delegate {
      case back
      case logout
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapListRow(type):
        switch type {
        case .logout:
          return .send(._requestLogout)
        }
        
      case ._requestLogout:
        return .run { send in
          try authenticationService.logout()
          await send(._logoutResponse(.success(0)))
        } catch: { error, send in
          await send(._logoutResponse(.failure(error.toFMError)))
        }
        
      case ._logoutResponse(.success):
        return .send(.delegate(.logout))
        
      case let ._logoutResponse(.failure(error)):
        print(error.localizedDescription)
      }
      
      return .none
    }
  }
}

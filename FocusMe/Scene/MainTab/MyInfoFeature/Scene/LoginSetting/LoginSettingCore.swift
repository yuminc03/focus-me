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
    
    var isLogoutPresent = false
  }
  
  @Dependency(\.authenticationService) var authenticationService
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    case delegate(Delegate)
    
    case tapBackButton
    case tapListRow(LoginSetting)
    case alert(FMAlertButtonType)
    
    case _setIsLogoutPresent(Bool)
    case _requestLogout
    case _logoutResponse(Result<Int, FMError>)
    
    enum Delegate {
      case back
      case logout
    }
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding: break
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapListRow(type):
        switch type {
        case .logout:
          return .send(._setIsLogoutPresent(true))
        }
        
      case let .alert(type):
        switch type {
        case .cancel:
          return .send(._setIsLogoutPresent(false))
          
        case .confirm:
          return .run { send in
            await send(._setIsLogoutPresent(false))
            await send(._requestLogout)
          }
        }
        
      case let ._setIsLogoutPresent(isPresent):
        state.isLogoutPresent = isPresent
        
      case ._requestLogout:
        return .run { send in
          try authenticationService.logout()
          await send(._logoutResponse(.success(0)))
        } catch: { error, send in
          await send(._logoutResponse(.failure(error.toFMError)))
        }
        
      case ._logoutResponse(.success):
        NotiManager.post(key: .logout)
        return .send(.delegate(.logout))
        
      case let ._logoutResponse(.failure(error)):
        print(error.localizedDescription)
      }
      
      return .none
    }
  }
}

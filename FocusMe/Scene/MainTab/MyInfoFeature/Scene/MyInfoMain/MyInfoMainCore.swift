import Foundation

import ComposableArchitecture

@Reducer
struct MyInfoMainCore {
  struct ListItem: Equatable, Identifiable {
    let id = UUID()
    let type: MyInfo
  }
  
  enum MyInfo: String {
    case developer = "개발자 소개"
    case sourceCode = "앱 소스코드"
    case loginSetting = "로그인 설정"
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    let developerIntroURL = "https://github.com/yuminc03"
    let sourceURL = "https://github.com/yuminc03/focus-me"
    
    let items: [ListItem] = [
      .init(type: .developer),
      .init(type: .sourceCode),
      .init(type: .loginSetting),
    ]
    
    var isToastPresent = false
    var toastMessage = ""
  }
  
  enum Action: BindableAction {
    case binding(BindingAction<State>)
    case delegate(Delegate)
    case tapListItem(MyInfo)
    
    case _setToastPresent(Bool)
    
    enum Delegate {
      case detail(MyInfo)
    }
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding: break
      case .delegate: break
      case let .tapListItem(type):
        state.toastMessage = ""
        
        switch type {
        case .developer:
          state.toastMessage = "개발자 설명을 열 수 없습니다. 잠시 후 시도해주세요."
          
        case .sourceCode:
          state.toastMessage = "소스코드 URL을 열 수 없습니다. 잠시 후 시도해주세요."
          
        case .loginSetting:
          return .send(.delegate(.detail(.loginSetting)))
        }
        
      case let ._setToastPresent(isPresent):
        state.isToastPresent = isPresent
      }
      
      return .none
    }
  }
}

import Foundation

import ComposableArchitecture

@Reducer
struct MyInfoMainCore {
  struct ListItem: Equatable, Identifiable {
    let id = UUID()
    let type: MyInfo
  }
  
  enum MyInfo: String {
    case notice = "공지사항"
    case developer = "개발자 소개"
    case sourceCode = "앱 소스코드"
    case loginSetting = "로그인 설정"
  }
  
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    let items: [ListItem] = [
      .init(type: .notice),
      .init(type: .developer),
      .init(type: .sourceCode),
      .init(type: .loginSetting),
    ]
  }
  
  enum Action {
    case delegate(Delegate)
    case tapListItem(MyInfo)
    
    enum Delegate {
      case detail(MyInfo)
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case let .tapListItem(type):
        return .send(.delegate(.detail(type)))
      }
      
      return .none
    }
  }
}

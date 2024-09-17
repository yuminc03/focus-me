import Foundation

import ComposableArchitecture

@Reducer
struct OfficialMBTIMainCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var titleLinkPreview = RepresentedLinkPreviewCore.State(url: "https://www.assesta.com/Company/Assesta_Info.asp")
    var inspectionKind = RepresentedLinkPreviewCore.State(url: "https://www.career4u.net/tester/mbti_intro.asp")
    var officialTest = RepresentedLinkPreviewCore.State(url: "https://saram.assesta.com/Service/STEP1?utm_source=instagram&utm_medium=social&utm_campaign=2022_aug_littly&utm_content=link1")
    var instagramLink = RepresentedLinkPreviewCore.State(url: "https://www.instagram.com/assesta_official/?hl=ko")
    var youtubeLink = RepresentedLinkPreviewCore.State(url: "https://www.youtube.com/@assestashare")
  }
  
  enum Action {
    case delegate(Delegate)
    case titleLinkPreview(RepresentedLinkPreviewCore.Action)
    case inspectionKind(RepresentedLinkPreviewCore.Action)
    case officialTest(RepresentedLinkPreviewCore.Action)
    case instagramLink(RepresentedLinkPreviewCore.Action)
    case youtubeLink(RepresentedLinkPreviewCore.Action)
    
    case tapBackButton
    case tapLinkPreview(String)
    
    enum Delegate {
      case back
      case web(url: String)
    }
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.titleLinkPreview, action: \.titleLinkPreview) {
      RepresentedLinkPreviewCore()
    }
    Scope(state: \.inspectionKind, action: \.inspectionKind) {
      RepresentedLinkPreviewCore()
    }
    Scope(state: \.officialTest, action: \.officialTest) {
      RepresentedLinkPreviewCore()
    }
    Scope(state: \.instagramLink, action: \.instagramLink) {
      RepresentedLinkPreviewCore()
    }
    Scope(state: \.youtubeLink, action: \.youtubeLink) {
      RepresentedLinkPreviewCore()
    }
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .titleLinkPreview: break
      case .inspectionKind: break
      case .officialTest: break
      case .instagramLink: break
      case .youtubeLink: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      case let .tapLinkPreview(urlString):
        return .send(.delegate(.web(url: urlString)))
      }
      
      return .none
    }
  }
}

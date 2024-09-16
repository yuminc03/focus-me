import SwiftUI

import ComposableArchitecture

@Reducer
struct OfficialMBTIMainCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    
    var titleLinkPreview = RepresentedLinkPreviewCore.State(url: "https://www.assesta.com/Company/Assesta_Info.asp")
  }
  
  enum Action {
    case delegate(Delegate)
    case titleLinkPreview(RepresentedLinkPreviewCore.Action)
    case tapBackButton
    
    enum Delegate {
      case back
    }
  }
  
  var body: some ReducerOf<Self> {
    Scope(state: \.titleLinkPreview, action: \.titleLinkPreview) {
      RepresentedLinkPreviewCore()
    }
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .titleLinkPreview: break
      case .tapBackButton:
        return .send(.delegate(.back))
        
      }
      
      return .none
    }
  }
}

/// 정식 MBTI 검사 받기 Main 화면
struct OfficialMBTIMainView: View {
  @Perception.Bindable private var store: StoreOf<OfficialMBTIMainCore>
  
  init(store: StoreOf<OfficialMBTIMainCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ScrollView {
        VStack(spacing: 20) {
          TitleSection
            .padding(.top, 30)
          
        }
        .padding(.horizontal, 20)
      }
      .backgroundColor()
      .fmNavigation(title: "정식 MBTI 검사") {
        store.send(.tapBackButton)
      }
      .onAppear {
        NotiManager.post(key: .hideTab)
      }
    }
  }
}

private extension OfficialMBTIMainView {
  var TitleSection: some View {
    VStack(spacing: 10) {
      Text("어세스타에 대해서..")
        .customFont(.notoSansKRSemiBold, size: 28)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      Text("'어세스타'는 심리 검사/교육/서비스 전문기관이며 국내 유일 정식 MBTIⓇ 검사 보급기관입니다.")
        .frame(maxWidth: .infinity, alignment: .leading)
        .customFont(size: 16)

      Text("더 자세한 정보 ⬇️")
        .customFont(size: 14)
        .frame(maxWidth: .infinity, alignment: .leading)
      RepresentedLinkPreview(store: store.scope(
        state: \.titleLinkPreview,
        action: \.titleLinkPreview
      ))
    }
    .foregroundColor(.textPrimary1)
  }
  
  var KindOfMBTISection: some View {
    VStack(spacing: 20) {
      Text("MBTI 검사 종류")
        .customFont(.notoSansKRSemiBold, size: 24)
        .frame(maxWidth: .infinity, alignment: .leading)
      
    }
    .foregroundColor(.textPrimary1)
  }
}

#Preview {
  OfficialMBTIMainView(store: .init(initialState: OfficialMBTIMainCore.State()) {
    OfficialMBTIMainCore()
  })
}

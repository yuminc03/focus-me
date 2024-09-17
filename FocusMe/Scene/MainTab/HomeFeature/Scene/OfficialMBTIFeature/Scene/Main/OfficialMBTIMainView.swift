import SwiftUI

import ComposableArchitecture

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
          
          KindOfMBTISection
          OfficialTestSection
          InstagramLinkSection
          YoutubeLinkSection
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
      Text("어세스타")
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
      .onTapGesture {
        store.send(.tapLinkPreview(store.titleLinkPreview.url))
      }
    }
    .foregroundColor(.textPrimary1)
  }
  
  var KindOfMBTISection: some View {
    LinkPreview(title: "MBTI 검사 종류") {
      RepresentedLinkPreview(store: store.scope(
        state: \.inspectionKind,
        action: \.inspectionKind
      ))
      .onTapGesture {
        store.send(.tapLinkPreview(store.inspectionKind.url))
      }
    }
  }
  
  var OfficialTestSection: some View {
    LinkPreview(title: "정식 MBTI 검사") {
      RepresentedLinkPreview(store: store.scope(
        state: \.officialTest,
        action: \.officialTest
      ))
      .onTapGesture {
        store.send(.tapLinkPreview(store.officialTest.url))
      }
    }
  }
  
  var InstagramLinkSection: some View {
    LinkPreview(title: "어세스타 instagram") {
      RepresentedLinkPreview(store: store.scope(
        state: \.instagramLink,
        action: \.instagramLink
      ))
      .onTapGesture {
        store.send(.tapLinkPreview(store.instagramLink.url))
      }
    }
  }
  
  var YoutubeLinkSection: some View {
    LinkPreview(title: "어세스타 youtube") {
      RepresentedLinkPreview(store: store.scope(
        state: \.youtubeLink,
        action: \.youtubeLink
      ))
      .onTapGesture {
        store.send(.tapLinkPreview(store.youtubeLink.url))
      }
    }
  }
}

#Preview {
  OfficialMBTIMainView(store: .init(initialState: OfficialMBTIMainCore.State()) {
    OfficialMBTIMainCore()
  })
}

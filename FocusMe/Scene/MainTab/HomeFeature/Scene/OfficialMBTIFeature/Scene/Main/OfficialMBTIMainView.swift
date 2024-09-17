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
    }
    .foregroundColor(.textPrimary1)
  }
  
  var KindOfMBTISection: some View {
    VStack(spacing: 10) {
      Text("MBTI 검사 종류")
        .customFont(.notoSansKRSemiBold, size: 24)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      RepresentedLinkPreview(store: store.scope(
        state: \.inspectionKind,
        action: \.inspectionKind
      ))
    }
    .foregroundColor(.textPrimary1)
  }
  
  var OfficialTestSection: some View {
    VStack(spacing: 10) {
      Text("정식 MBTI 검사")
        .customFont(.notoSansKRSemiBold, size: 24)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      RepresentedLinkPreview(store: store.scope(
        state: \.officialTest,
        action: \.officialTest
      ))
    }
    .foregroundColor(.textPrimary1)
  }
  
  var InstagramLinkSection: some View {
    VStack(spacing: 10) {
      Text("어세스타 instagram")
        .customFont(.notoSansKRSemiBold, size: 24)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      RepresentedLinkPreview(store: store.scope(
        state: \.instagramLink,
        action: \.instagramLink
      ))
    }
    .foregroundColor(.textPrimary1)
  }
  
  var YoutubeLinkSection: some View {
    VStack(spacing: 10) {
      Text("어세스타 youtube")
        .customFont(.notoSansKRSemiBold, size: 24)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      RepresentedLinkPreview(store: store.scope(
        state: \.youtubeLink,
        action: \.youtubeLink
      ))
    }
    .foregroundColor(.textPrimary1)
  }
}

#Preview {
  OfficialMBTIMainView(store: .init(initialState: OfficialMBTIMainCore.State()) {
    OfficialMBTIMainCore()
  })
}

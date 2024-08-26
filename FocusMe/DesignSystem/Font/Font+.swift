import SwiftUI

import RswiftResources

enum NotoSans {
  case notoSansKRThin
  case notoSansKRSemiBold
  case notoSansKRRegular
  case notoSansKRMedium
  case notoSansKRLight
  case notoSansKRExtraLight
  case notoSansKRExtraBold
  case notoSansKRBold
  case notoSansKRBlack
  
  var resource: FontResource {
    switch self {
    case .notoSansKRThin:
      return R.font.notoSansKRThin
    case .notoSansKRSemiBold:
      return R.font.notoSansKRSemiBold
    case .notoSansKRRegular:
      return R.font.notoSansKRRegular
    case .notoSansKRMedium:
      return R.font.notoSansKRMedium
    case .notoSansKRLight:
      return R.font.notoSansKRLight
    case .notoSansKRExtraLight:
      return R.font.notoSansKRExtraLight
    case .notoSansKRExtraBold:
      return R.font.notoSansKRExtraBold
    case .notoSansKRBold:
      return R.font.notoSansKRBold
    case .notoSansKRBlack:
      return R.font.notoSansKRBlack
    }
  }
}

extension View {
  /**
   Custom Font 적용
   ```
   Text("Title")
    .customFont(.notoSansKRRegular, size: 20)
   ```
   */
  func customFont(
    _ name: NotoSans = .notoSansKRRegular,
    size: CGFloat = 16
  ) -> some View {
    self
      .font(.custom(name.resource, size: size))
  }
}

#Preview {
  Group {
    Text("Title")
      .customFont(.notoSansKRBlack, size: 20)
    
    Text("제목")
      .customFont(.notoSansKRMedium, size: 24)
  }
}

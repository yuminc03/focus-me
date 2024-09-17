import SwiftUI

import ComposableArchitecture

/// LinkPreview를 눌렀을 때 Link로 들어감
struct SafariWebView: View {
  @Perception.Bindable private var store: StoreOf<SafariWebCore>
  
  init(store: StoreOf<SafariWebCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      RepresentedSafariVC(store: store.scope(state: \.safariWeb, action: \.safariWeb))
    }
  }
}

#Preview {
  SafariWebView(store: .init(initialState: SafariWebCore.State(safariWeb: .init(url: "https://www.google.co.kr"))) {
    SafariWebCore()
  })
}

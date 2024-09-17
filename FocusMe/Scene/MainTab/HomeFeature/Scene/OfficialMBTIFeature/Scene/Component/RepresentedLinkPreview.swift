import SwiftUI
import LinkPresentation

import ComposableArchitecture

/// Contents가 풍부한 URL을 일관된 방식으로 제시함
struct RepresentedLinkPreview: UIViewRepresentable {
  private let store: StoreOf<RepresentedLinkPreviewCore>
  private let viewStore: ViewStoreOf<RepresentedLinkPreviewCore>
  
  init(store: StoreOf<RepresentedLinkPreviewCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  func makeUIView(context: Context) -> LPLinkView {
    let linkView = LPLinkView()
    linkView.sizeToFit()
    fetchMetadata()
    
    return linkView
  }
  
  func updateUIView(_ uiView: LPLinkView, context: Context) {
    uiView.metadata = viewStore.metadata
  }
  
  private func fetchMetadata() {
    guard let url = URL(string: viewStore.url) else {
      return
    }
    
    Task {
      do {
        let metadataProvider = LPMetadataProvider()
        let metadata = try await metadataProvider.startFetchingMetadata(for: url)
        DispatchQueue.main.async {
          store.send(.setMetadata(metadata))
        }
      } catch {
        print(error.localizedDescription)
      }
    }
  }
}

#Preview {
  RepresentedLinkPreview(store: .init(initialState: .init(url: "https://www.instagram.com/assesta_official/?hl=ko")) {
    RepresentedLinkPreviewCore()
  })
}

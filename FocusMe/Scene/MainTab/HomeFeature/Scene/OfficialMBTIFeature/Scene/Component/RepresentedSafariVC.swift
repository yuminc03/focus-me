import SwiftUI
import SafariServices

import ComposableArchitecture

struct RepresentedSafariVC: UIViewControllerRepresentable {
  private let store: StoreOf<RepresentedSafariCore>
  private let viewStore: ViewStoreOf<RepresentedSafariCore>
  
  init(store: StoreOf<RepresentedSafariCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  func makeUIViewController(context: Context) -> SFSafariViewController {
    guard let url = URL(string: viewStore.url) else {
      return SFSafariViewController(url: URL(string: "https://www.google.co.kr")!)
    }
    
    return SFSafariViewController(url: url)
  }
  
  func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) { }
}

#Preview {
  RepresentedSafariVC(store: .init(initialState: RepresentedSafariCore.State(url: "https://www.google.co.kr")) {
    RepresentedSafariCore()
  })
}

import SwiftUI

extension View {
  func loadingView(isLoading: Bool) -> some View {
    ZStack {
      self
      LoadingView(isLoading: isLoading)
    }
  }
}

struct LoadingView: View {
  let isLoading: Bool
  
  var body: some View {
    ZStack {
      if isLoading {
        Rectangle()
          .fill(.clear)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .ignoresSafeArea()
        
        ProgressView()
          .progressViewStyle(.circular)
          .tint(.purple)
          .scaleEffect(2.0, anchor: .center)
      }
    }
  }
}

#Preview {
  LoadingView(isLoading: true)
}

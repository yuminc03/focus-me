import SwiftUI

extension View {
  func cornerRadius(_ radius: CGFloat) -> some View {
    self
      .clipShape(RoundedRectangle(cornerRadius: radius))
  }
  
  func backgroundColor(_ color: Color = .bg) -> some View {
    ZStack {
      color
        .ignoresSafeArea()
      
      self
    }
  }
}

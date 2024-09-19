import SwiftUI

extension View {
  /// View에 cornerRadius를 주기
  func cornerRadius(_ radius: CGFloat) -> some View {
    self
      .clipShape(RoundedRectangle(cornerRadius: radius))
  }
  
  /// 바탕 색깔을 바꿀 때 사용
  func backgroundColor(_ color: Color = .bg) -> some View {
    ZStack {
      color
        .ignoresSafeArea()
      
      self
    }
  }
  
  /// viewDidLoad
  func onDidLoad(_ action: @escaping () -> Void) -> some View {
    modifier(ViewDidLoadModifier(action: action))
  }
}

struct ViewDidLoadModifier: ViewModifier {
  @State private var viewDidLoad = false
  let action: () -> Void
  
  func body(content: Content) -> some View {
    content
      .onAppear {
        if viewDidLoad == false {
          action()
        }
        
        viewDidLoad = true
      }
  }
}

import SwiftUI

/// 이동가능한 화면들
enum Destination {
  case login
  case signup
  
  @ViewBuilder
  var view: some View {
    switch self {
    case .login:
      LoginView()
      
    case .signup:
      SignUpView()
    }
  }
}

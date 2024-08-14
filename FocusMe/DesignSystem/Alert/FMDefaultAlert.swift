import SwiftUI

struct FMDefaultAlert: View {
  private let title: String?
  private let message: String?
  
  init(title: String? = nil, message: String? = nil) {
    self.title = title
    self.message = message
  }
  
  var body: some View {
    VStack(spacing: 20) {
      if let title {
        Text(title)
          .customFont(.notoSansKRBold, size: 20)
          .foregroundColor(.purple)
      }
      
      if let message {
        Text(message)
          .customFont(size: 16)
          .foregroundColor(.textPrimary1)
      }
    }
    .multilineTextAlignment(.center)
  }
}

#Preview {
  FMDefaultAlert(title: "제목", message: "메시지")
}

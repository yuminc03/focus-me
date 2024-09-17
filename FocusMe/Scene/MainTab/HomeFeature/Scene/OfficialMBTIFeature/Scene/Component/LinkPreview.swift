import SwiftUI

struct LinkPreview<Content: View>: View {
  private let title: String
  private let content: () -> Content
  
  init(title: String, @ViewBuilder _ content: @escaping () -> Content) {
    self.title = title
    self.content = content
  }
  
  var body: some View {
    VStack(spacing: 10) {
      Text(title)
        .customFont(.notoSansKRSemiBold, size: 24)
        .frame(maxWidth: .infinity, alignment: .leading)
      
      content()
    }
    .foregroundColor(.textPrimary1)
  }
}

#Preview {
  LinkPreview(title: "MBTI 검사 종류") {
    Text("Content")
  }
}

import SwiftUI

struct AppView: View {
  @State private var emailText: String = ""
  
  var body: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
      
      VStack(spacing: 20) {
        TitleLabel
        
        EmailView
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 20)
    }
  }
}

private extension AppView {
  var TitleLabel: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("로그인")
        .customFont(.notoSansKRSemiBold, size: 30)

      Text("오늘은 나에게\n더 집중하는 시간을 가져보세요. 🙂")
        .customFont(size: 16)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var EmailView: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이메일")
        .customFont(.notoSansKRMedium, size: 20)
      FMTextField(placeholder: "이메일을 입력하세요", text: $emailText)
    }
  }
}

#Preview {
  AppView()
}

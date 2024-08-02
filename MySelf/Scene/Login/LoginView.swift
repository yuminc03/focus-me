import SwiftUI

struct LoginView: View {
  @State private var emailText = ""
  @State private var passwordText = ""
  
  var body: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
      
      VStack(spacing: 20) {
        TitleLabel
          .padding(.top, 40)
          .padding(.bottom, 40)
        
        EmailView
          .padding(.bottom, 20)
        
        PasswordView
          .padding(.bottom, 40)
        
        LoginButton
        
        Spacer()
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal, 20)
    }
  }
}

private extension LoginView {
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
  
  var PasswordView: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호")
        .customFont(.notoSansKRMedium, size: 20)
      FMTextField(type: .secure, placeholder: "비밀번호를 입력하세요", text: $passwordText)
    }
  }
  
  var LoginButton: some View {
    Button {
      
    } label: {
      Text("로그인")
        .foregroundColor(.white)
        .font(.system(size: 16))
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(RoundedRectangle(cornerRadius: 10))
    }
  }
}

#Preview {
  AppView()
}

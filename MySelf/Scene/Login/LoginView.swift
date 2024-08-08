import SwiftUI

struct LoginView: View {
  enum FocusField {
    case email
    case password
  }
  
  @StateObject private var vm = LoginVM()
  @State private var email = ""
  @State private var password = ""
  
  @FocusState private var focusField: FocusField?
  
  var body: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
      
      VStack(spacing: 20) {
        TitleLabel
          .padding(.top, 40)
          .padding(.bottom, 20)
        
        EmailView
        
        PasswordView
          .padding(.bottom, 20)
        
        LoginButton
        
        SignupButton
        
        Spacer()
      }
      .padding(.horizontal, 20)
      .contentShape(Rectangle())
      .onTapGesture {
        endEditing()
      }
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
      FMTextField(placeholder: "이메일을 입력하세요", text: $email)
        .keyboardType(.emailAddress)
        .focused($focusField, equals: .email)
        .onSubmit {
          focusField = .password
        }
    }
  }
  
  var PasswordView: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호")
        .customFont(.notoSansKRMedium, size: 20)
      FMTextField(
        type: .secure,
        placeholder: "비밀번호를 입력하세요",
        text: $password
      )
      .focused($focusField, equals: .password)
    }
  }
  
  var LoginButton: some View {
    FMButton(title: "로그인") {
      vm.login(email: email, password: password)
    }
  }
  
  var SignupButton: some View {
    Button {
      
    } label: {
      Text("회원가입 하러가기")
        .customFont(size: 16)
        .foregroundColor(.textPrimary1)
    }
  }
}

#Preview {
  LoginView()
}

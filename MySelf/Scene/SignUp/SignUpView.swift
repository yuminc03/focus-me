import SwiftUI

struct SignUpView: View {
  @StateObject private var vm = SignUpVM()
  @State private var email = ""
  @State private var password = ""
  @State private var confirmPassword = ""
  @State private var confirmPasswordError = ""
  @State private var name = ""
  
  var body: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
      
      VStack(spacing: 20) {
        TitleLabel
          .padding(.vertical, 40)
        
        EmailSection
        
        PasswordSection
        
        PasswordConfirmSection
        
        NameSection
        
        SignUpButton
          .padding(.top, 10)
        
        ExistAccountButton
        
        Spacer()
      }
      .padding(.horizontal, 20)
    }
  }
}

// MARK: - Component

private extension SignUpView {
  var TitleLabel: some View {
    Text("회원가입")
      .customFont(.notoSansKRSemiBold, size: 30)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var EmailSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이메일")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        placeholder: "예) test01@gmail.com",
        text: $email
      )
      .keyboardType(.emailAddress)
    }
  }
  
  var PasswordSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        type: .secure,
        placeholder: "비밀번호 입력",
        text: $password
      )
    }
  }
  
  var PasswordConfirmSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호 확인")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        type: .secure,
        placeholder: "비밀번호 다시 입력",
        text: $confirmPassword
      )
      .errorMessage(errorMessage: $confirmPasswordError)
      .onChange(of: confirmPassword) { _ in
        changeConfirmPassword()
      }
    }
  }
  
  var NameSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이름")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        placeholder: "이름 입력",
        text: $name
      )
    }
  }
  
  var SignUpButton: some View {
    FMButton(title: "회원가입") {
      tapSignUpButton()
    }
  }
  
  var ExistAccountButton: some View {
    VStack(alignment: .center) {
      Button {
        tapExistAccountButton()
      } label: {
        Text("이미 계정이 있나요?")
          .customFont(size: 16)
          .foregroundColor(.textPrimary1)
      }
    }
  }
}

// MARK: - Function

private extension SignUpView {
  private func tapSignUpButton() {
    vm.signup(email: email, password: password, name: name)
  }
  
  private func changeConfirmPassword() {
    confirmPasswordError = vm.changeConfirmPassword(
      password: password,
      confirmPassword: confirmPassword
    )
  }
  
  private func tapExistAccountButton() {
    
  }
}

#Preview {
  SignUpView()
}

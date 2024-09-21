import SwiftUI

import ComposableArchitecture

struct LoginView: View {
  @Perception.Bindable private var store: StoreOf<LoginCore>
  
  @FocusState private var focusField: LoginCore.State.Field?
  
  init(store: StoreOf<LoginCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ScrollView {
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
      }
      .backgroundColor()
      .contentShape(Rectangle())
      .onTapGesture {
        endEditing()
      }
      .bind($store.focusedField, to: $focusField)
      .loadingView(isLoading: store.isLoading)
      .fmAlert(isPresented: $store.isLoginErrorPresented) {
        FMAlertContainer {
          FMDefaultAlert(message: store.loginError ?? "")
        }
        .addButton(type: .confirm, buttonStyle: .primary(title: "확인")) {
          store.send(._setIsLoginErrorPresented(false))
        }
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
      FMTextField(placeholder: "이메일을 입력하세요", text: $store.email.sending(\.didChangeEmail))
        .keyboardType(.emailAddress)
        .focused($focusField, equals: .email)
        .onSubmit {
          store.send(.onSubmit(.email))
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
        text: $store.password.sending(\.didChangePassword)
      )
      .focused($focusField, equals: .password)
    }
  }
  
  var LoginButton: some View {
    FMButton(title: "로그인") {
      endEditing()
      store.send(.tapLoginButton)
    }
    .disabled(store.isConfirmButtonDisabled)
  }
  
  var SignupButton: some View {
    Button {
      store.send(.tapSignupButton)
    } label: {
      Text("회원가입 하러가기")
        .customFont(size: 16)
        .foregroundColor(.textPrimary1)
    }
  }
}

#Preview {
  LoginView(store: .init(initialState: LoginCore.State()) {
    LoginCore()
  })
}

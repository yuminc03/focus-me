import SwiftUI

import ComposableArchitecture

struct SignUpView: View {
  @Perception.Bindable private var store: StoreOf<SignUpCore>
  
  @FocusState private var focusedField: SignUpCore
    .State.Field?
  
  init(store: StoreOf<SignUpCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 20) {
        EmailSection
          .padding(.top, 40)

        PasswordSection
        
        PasswordConfirmSection
        
        NameSection
        
        SignUpButton
          .padding(.top, 10)
        
        ExistAccountButton
        
        Spacer()
      }
      .padding(.horizontal, 20)
      .backgroundColor()
      .fmNavigation(title: "회원가입") {
        store.send(.tapBackButton)
      }
      .loadingView(isLoading: store.isLoading)
      .fmAlert(isPresented: $store.isSignupErrorPresented) {
        FMAlertContainer {
          FMDefaultAlert(message: store.signupError ?? "")
        }
        .addButton(type: .confirm, buttonStyle: .primary(title: "확인")) {
          store.send(._setIsSignupErrorPresented(false))
        }
      }
      .bind($store.focusedField, to: $focusedField)
      .contentShape(Rectangle())
      .onTapGesture {
        endEditing()
      }
    }
  }
}

// MARK: - Component

private extension SignUpView {
  var EmailSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이메일")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        placeholder: "예) test01@gmail.com",
        text: $store.email
      )
      .keyboardType(.emailAddress)
      .focused($focusedField, equals: .email)
      .onSubmit {
        store.send(.onSubmit(.name))
      }
    }
  }
  
  var PasswordSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        type: .secure,
        placeholder: "비밀번호 입력",
        text: $store.password
      )
      .focused($focusedField, equals: .password)
      .onSubmit {
        store.send(.onSubmit(.password))
      }
    }
  }
  
  var PasswordConfirmSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("비밀번호 확인")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        type: .secure,
        placeholder: "비밀번호 다시 입력",
        text: $store.confirmPassword
      )
      .errorMessage(errorMessage: $store.confirmPasswordError)
      .focused($focusedField, equals: .confirmPassword)
      .onChange(of: store.confirmPassword) { value in
        store.send(.didChangeConfirmPassword(value))
      }
      .onSubmit {
        store.send(.onSubmit(.confirmPassword))
      }
    }
  }
  
  var NameSection: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text("이름")
        .customFont(.notoSansKRSemiBold, size: 16)
      
      FMTextField(
        placeholder: "이름 입력",
        text: $store.name
      )
      .focused($focusedField, equals: .name)
    }
  }
  
  var SignUpButton: some View {
    FMButton(title: "회원가입") {
      store.send(.tapSignUpButton)
    }
    .disabled(store.isConfirmButtonDisabled)
  }
  
  var ExistAccountButton: some View {
    VStack(alignment: .center) {
      Button {
        store.send(.tapExistAccountButton)
      } label: {
        Text("이미 계정이 있나요?")
          .customFont(size: 16)
          .foregroundColor(.textPrimary1)
      }
    }
  }
}

#Preview {
  SignUpView(store: .init(initialState: SignUpCore.State()) {
    SignUpCore()
  })
}

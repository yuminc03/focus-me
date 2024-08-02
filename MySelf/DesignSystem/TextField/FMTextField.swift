import SwiftUI

extension FMTextField {
  func cornerRadius(_ radius: CGFloat) -> FMTextField {
    var state = self
    state.cornerRadius = radius
    return state
  }
  
  func hasClearButton(_ hasClear: Bool = true) -> FMTextField {
    var state = self
    state.hasClearButton = hasClear
    return state
  }
}

/// 공통으로 사용할 TextField
struct FMTextField: View {
  let type: TextFieldType
  let placeholder: String

  @Binding var text: String
  var errorMessage: Binding<String?>?
  var cornerRadius: CGFloat = 10
  var hasClearButton = true
  
  enum TextFieldType {
    case `default`
    case secure
  }
  
  init(
    type: TextFieldType = .default,
    placeholder: String,
    text: Binding<String>,
    errorMessage: Binding<String?>? = nil
  ) {
    self.type = type
    self.placeholder = placeholder
    self._text = text
    self.errorMessage = errorMessage
  }
  
  var body: some View {
    HStack(spacing: 10) {
      AnyTextField
        .autocorrectionDisabled()
      
      if hasClearButton && text.isEmpty == false {
        Button {
          
        } label: {
          Image(systemName: "xmark.circle.fill")
            .resizable()
            .frame(width: 20, height: 20)
            .foregroundColor(.black)
        }
      }
    }
    .padding(.horizontal, 10)
    .padding(.vertical, 14)
    .background(
      RoundedRectangle(cornerRadius: cornerRadius)
        .fill(Color.gray)
    )
  }
}

private extension FMTextField {
  @ViewBuilder
  var AnyTextField: some View {
    switch type {
    case .default:
      TextField(placeholder, text: $text)
    case .secure:
      SecureField(placeholder, text: $text)
    }
  }
}

#Preview {
  FMTextField(placeholder: "입력 테스트", text: .constant("입력된 텍스트"))
}

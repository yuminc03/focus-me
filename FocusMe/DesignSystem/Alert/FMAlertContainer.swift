import SwiftUI

struct FMAlertContainer<Content: View>: View {
  let content: () -> Content
  
  var leftButton: FMAlertButton?
  var rightButton: FMAlertButton?
  var leftButtonAction: (() -> Void)?
  var rightButtonAction: (() -> Void)?
  
  var body: some View {
    VStack(spacing: 30) {
      content()
      
      HStack(spacing: 0) {
        if let leftButton {
          FMButton(title: leftButton.title) {
            leftButtonAction?()
          }
          .cornerRadius(0)
          .foregroundColor(leftButton.foregroundColor)
          .backgroundColor(leftButton.backgroundColor)
          .disabledBgColor(leftButton.disabledBgColor)
          .pressedBgColor(leftButton.pressedBgColor)
        }
        
        if let rightButton {
          FMButton(title: rightButton.title) {
            rightButtonAction?()
          }
          .cornerRadius(0)
          .foregroundColor(rightButton.foregroundColor)
          .backgroundColor(rightButton.backgroundColor)
          .disabledBgColor(rightButton.disabledBgColor)
          .pressedBgColor(rightButton.pressedBgColor)
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
}

extension FMAlertContainer {
  func addButton(
    type: FMAlertButtonType,
    buttonStyle: FMAlertButton,
    buttonAction: @escaping () -> Void
  ) -> FMAlertContainer {
    var state = self
    
    switch type {
    case .confirm:
      state.rightButton = buttonStyle
      state.rightButtonAction = buttonAction
    case .cancel:
      state.leftButton = buttonStyle
      state.leftButtonAction = buttonAction
    }
    
    return state
  }
}

#Preview {
  FMAlertContainer {
    HStack(spacing: 10) {
      Text("Title")
      Text("Message")
    }
  }
  .addButton(type: .cancel, buttonStyle: .cancel(title: "취소")) {
    print("cancel")
  }
  .addButton(type: .confirm, buttonStyle: .primary(title: "확인")) {
    print("primary")
  }
}

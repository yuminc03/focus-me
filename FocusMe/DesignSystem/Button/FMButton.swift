import SwiftUI

extension FMButton {
  func cornerRadius(_ radius: CGFloat) -> FMButton {
    var state = self
    state.cornerRadius = radius
    return state
  }
  
  func backgroundColor(_ color: Color) -> FMButton {
    var state = self
    state.backgroundColor = color
    return state
  }
  
  func pressedBgColor(_ color: Color) -> FMButton {
    var state = self
    state.pressedBgColor = color
    return state
  }
  
  func disabledBgColor(_ color: Color) -> FMButton {
    var state = self
    state.disabledBgColor = color
    return state
  }
  
  func foregroundColor(_ color: Color) -> FMButton {
    var state = self
    state.foregroundColor = color
    return state
  }
}

struct FMButton: View {
  @Environment(\.isEnabled) var isEnabled
  
  let title: String
  let action: () -> Void
  var foregroundColor: Color = .white
  var backgroundColor: Color = .blueLemonAde
  var pressedBgColor: Color = .skyblue
  var disabledBgColor: Color = .lightBlue
  var cornerRadius: CGFloat = 8
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .frame(height: 56)
        .frame(maxWidth: .infinity)
    }
    .buttonStyle(FMButtonStyle(
      isEnabled: isEnabled,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      pressedBgColor: pressedBgColor,
      disabledBgColor: disabledBgColor,
      cornerRadius: cornerRadius
    ))
  }
}

struct FMButtonStyle: ButtonStyle {
  let isEnabled: Bool
  let foregroundColor: Color
  let backgroundColor: Color
  let pressedBgColor: Color
  let disabledBgColor: Color
  let cornerRadius: CGFloat
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(foregroundColor)
      .background(
        RoundedRectangle(cornerRadius: cornerRadius)
          .fill(isEnabled ? (configuration.isPressed ? pressedBgColor : backgroundColor) : disabledBgColor)
      )
  }
}

#Preview {
  FMButton(title: "버튼") {
    print("Action")
  }
}

import SwiftUI

extension SelectionButton {
  func foregroundColor(_ color: Color) -> SelectionButton {
    var state = self
    state.foregroundColor = color
    return state
  }
  
  func backgroundColor(_ color: Color) -> SelectionButton {
    var state = self
    state.backgroundColor = color
    return state
  }
  
  func pressedBgColor(_ color: Color) -> SelectionButton {
    var state = self
    state.pressedBgColor = color
    return state
  }
  
  func strokeColor(_ color: Color) -> SelectionButton {
    var state = self
    state.strokeColor = color
    return state
  }
}
/// 질문의 답변 버튼
struct SelectionButton: View {
  private let title: String
  private let action: () -> Void
  
  private var foregroundColor: Color = .deepPurple
  private var backgroundColor: Color = .white
  private var pressedBgColor: Color = .skyBlueTheme
  private var strokeColor: Color = .lavender
  
  init(title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .customFont(.notoSansKRMedium, size: 14)
     }
    .buttonStyle(SelectionButtonStyle(
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      pressedBgColor: pressedBgColor,
      strokeColor: strokeColor
    ))
  }
}

struct SelectionButtonStyle: ButtonStyle {
  let foregroundColor: Color
  let backgroundColor: Color
  let pressedBgColor: Color
  let strokeColor: Color
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(foregroundColor)
      .padding(20)
      .frame(maxWidth: .infinity)
      .background(configuration.isPressed ? pressedBgColor : backgroundColor)
      .clipShape(Capsule())
      .overlay {
        Capsule()
          .strokeBorder(strokeColor, lineWidth: 1)
      }
  }
}

#Preview {
  SelectionButton(title: "버튼 제목") {
    print("click")
  }
}

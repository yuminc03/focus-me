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
  private let isSelected: Bool
  private let action: () -> Void
  
  private var foregroundColor: Color = .blueLemonAde
  private var backgroundColor: Color = .white
  private var pressedBgColor: Color = .skyBlueTheme
  private var strokeColor: Color = .blueLemonAde
  
  init(title: String, isSelected: Bool, action: @escaping () -> Void) {
    self.title = title
    self.isSelected = isSelected
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .customFont(.notoSansKRMedium, size: 14)
     }
    .buttonStyle(SelectionButtonStyle(
      isSelected: isSelected,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      pressedBgColor: pressedBgColor,
      strokeColor: strokeColor
    ))
  }
}

struct SelectionButtonStyle: ButtonStyle {
  let isSelected: Bool
  let foregroundColor: Color
  let backgroundColor: Color
  let pressedBgColor: Color
  let strokeColor: Color
  
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .foregroundColor(isSelected ? .deepPurple : (
        configuration.isPressed ? .lavender : foregroundColor
      ))
      .padding(20)
      .frame(maxWidth: .infinity)
      .background(configuration.isPressed ? pressedBgColor : backgroundColor)
      .clipShape(Capsule())
      .overlay {
        Capsule()
          .strokeBorder(
            isSelected ? .deepPurple : (
              configuration.isPressed ? .lavender : strokeColor
            ),
            lineWidth: 1
          )
      }
      .animation(.easeInOut, value: isSelected)
  }
}

#Preview {
  SelectionButton(title: "버튼 제목", isSelected: true) {
    print("click")
  }
}

import SwiftUI

extension SelectionButton {
  func foregroundColor(_ color: Color) -> SelectionButton {
    var state = self
    state.foregroundColor = color
    return state
  }
}
/// 질문의 답변 버튼
struct SelectionButton: View {
  private let title: String
  private let action: () -> Void
  
  private var foregroundColor: Color = .deepPurple
  
  
  init(title: String, action: @escaping () -> Void) {
    self.title = title
    self.action = action
  }
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .customFont(.notoSansKRMedium, size: 14)
        .foregroundColor(foregroundColor)
        .padding(20)
        .frame(maxWidth: .infinity)
        .background(.white)
        .overlay {
          Capsule()
            .strokeBorder(.lavender, lineWidth: 4)
        }
        .clipShape(Capsule())
    }
  }
}

#Preview {
  SelectionButton(title: "버튼 제목") {
    print("click")
  }
}

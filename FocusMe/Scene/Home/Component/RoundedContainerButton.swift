import SwiftUI

extension RoundedContainerButton {
  func backgroundColor(_ color: Color) -> RoundedContainerButton {
    var state = self
    state.backgrounColor = color
    return state
  }
}

/// 둥근 모서리의 사각형 안에 제목과 내용이 포함된 버튼이 필요할 때 사용
struct RoundedContainerButton: View {
  let title: String
  let iconName: String
  let description: String
  let action: () -> Void
  
  var backgrounColor: Color = .blueLemonAde
  
  var body: some View {
    Button {
      action()
    } label: {
      VStack(spacing: 10) {
        HStack(spacing: 0) {
          Text(title)
            .customFont(.notoSansKRSemiBold, size: 20)
          
          Spacer()
          
          Image(systemName: iconName)
            .size(20)
        }
        
        Text(description)
          .customFont(size: 14)
          .multilineTextAlignment(.leading)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .foregroundColor(.white)
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(backgrounColor)
      )
    }
  }
}

#Preview {
  RoundedContainerButton(
    title: "제목적는 곳",
    iconName: .systemImage(.arrowRight),
    description: "상세 내용을 적는 곳"
  ) {
    print("Action")
  }
}

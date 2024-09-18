import SwiftUI

extension ListRow {
  func hideArrow() -> ListRow {
    var state = self
    state.isArrowHidden = true
    return state
  }
}

struct ListRow: View {
  let title: String
  var isArrowHidden = false
  
  var body: some View {
    HStack(spacing: 10) {
      Text(title)
        .customFont(size: 16)
      
      Spacer()
      
      if isArrowHidden == false {
        Image(systemName: .systemImage(.chevronRight))
          .size(15)
      }
    }
    .foregroundColor(.textPrimary1)
    .contentShape(Rectangle())
  }
}

#Preview {
  ListRow(title: "공지사항")
}

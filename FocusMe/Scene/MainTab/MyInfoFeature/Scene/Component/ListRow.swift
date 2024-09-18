import SwiftUI

struct ListRow: View {
  let title: String
  
  var body: some View {
    HStack(spacing: 10) {
      Text(title)
        .customFont(size: 16)
      
      Spacer()
      
      Image(systemName: .systemImage(.chevronRight))
        .size(15)
    }
    .foregroundColor(.textPrimary1)
  }
}

#Preview {
  ListRow(title: "공지사항")
}

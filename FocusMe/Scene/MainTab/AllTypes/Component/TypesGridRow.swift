import SwiftUI

struct TypesGridRow: View {
  let type: MBTI
  
  var body: some View {
    VStack(spacing: 5) {
      VStack(spacing: 0) {
        Text(type.title)
          .customFont(.notoSansKRSemiBold, size: 16)
        
        Text(type.description)
          .customFont(size: 12)
      }
      .foregroundColor(.white)
      
      Image(type.image)
        .size(120)
    }
    .padding(10)
    .background(.blueLemonAde)
    .overlay {
      RoundedRectangle(cornerRadius: 20)
        .strokeBorder(.skyblue, lineWidth: 4)
    }
    .clipShape(RoundedRectangle(cornerRadius: 20))
    .shadow(color: .black.opacity(0.6), radius: 10)
  }
}

#Preview {
  TypesGridRow(type: .istj)
}

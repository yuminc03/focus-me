import SwiftUI

struct TypesGridRow: View {
  let type: MBTI
  
  var body: some View {
    VStack(spacing: 5) {
      VStack(spacing: 20) {
        Text(type.name)
          .customFont(.notoSansKRSemiBold, size: 30)
        
        Text(type.description)
          .customFont(size: 12)
      }
      .foregroundColor(.white)
      
      // TODO: - 다음 버전에서 MBTI 이미지 추가 예정
//      Image(type.image)
//        .size(120)
    }
    .padding(10)
    .frame(maxWidth: .infinity)
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

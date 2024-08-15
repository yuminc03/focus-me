import SwiftUI

struct HomeView: View {
  var body: some View {
    ZStack {
      Color.bg
        .ignoresSafeArea()
      
      VStack(spacing: 20) {
        UserNameView
        StartTestView
      }
      .padding(.horizontal, 20)
    }
  }
}

private extension HomeView {
  var UserNameView: some View {
    Text("\(UserInfo.shared.name ?? "noname")님 안녕하세요! 🙂")
      .customFont(.notoSansKRSemiBold, size: 30)
      .foregroundColor(.textPrimary1)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
  
  var StartTestView: some View {
    Button {
      
    } label: {
      VStack(spacing: 10) {
        HStack(spacing: 0) {
          Text("MBTI 검사하기")
            .customFont(.notoSansKRSemiBold, size: 20)
          
          Spacer()
          
          Image(systemName: .systemImage(.arrowRight))
            .size(20)
        }
        
        Text("간단하게 MBTI를 검사하고 나의 성향을\n알아보세요. 🙂")
          .customFont(size: 14)
          .multilineTextAlignment(.leading)
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      .foregroundColor(.white)
      .padding(20)
      .background(
        RoundedRectangle(cornerRadius: 20)
          .fill(.blueLemonAde)
      )
    }
  }
}

#Preview {  
  HomeView()
}

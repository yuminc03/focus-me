import SwiftUI

struct HomeView: View {
  var body: some View {
    VStack(spacing: 20) {
      UserNameView
    }
    .padding(.horizontal, 20)
  }
}

private extension HomeView {
  var UserNameView: some View {
    Text("\(UserInfo.shared.name ?? "noname")님 안녕하세요! 🙂")
      .customFont(.notoSansKRSemiBold, size: 24)
      .foregroundColor(.textPrimary1)
      .frame(maxWidth: .infinity, alignment: .leading)
  }
}

#Preview {  
  HomeView()
}

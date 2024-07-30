import SwiftUI

struct AppView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 20) {
      titleLabel
    }
  }
}

#Preview {
  AppView()
}

extension AppView {
  private var titleLabel: some View {
    Text("안녕하십니까!")
      .foregroundColor(Color(R.color.bgColor))
  }
}

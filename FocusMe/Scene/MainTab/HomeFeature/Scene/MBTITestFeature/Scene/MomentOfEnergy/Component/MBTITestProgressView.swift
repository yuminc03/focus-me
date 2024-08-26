import SwiftUI

/// MBTI 검사 진행도를 보여주는 ProgressView
struct MBTITestProgressView: View {
  private var progressValue: CGFloat
  
  init(progressValue: CGFloat) {
    self.progressValue = progressValue
  }
  
  var body: some View {
    ZStack {
      ProgressView("현재 진행률: \(Int(progressValue)) / 20", value: progressValue, total: 20)
        .tint(.blueLemonAde)
        .foregroundColor(.deepPurple)
    }
  }
}

#Preview {
  MBTITestProgressView(progressValue: 1)
}

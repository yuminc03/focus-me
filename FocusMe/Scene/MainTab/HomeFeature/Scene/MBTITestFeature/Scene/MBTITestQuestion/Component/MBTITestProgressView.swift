import SwiftUI

/// MBTI 검사 진행도를 보여주는 ProgressView
struct MBTITestProgressView: View {
  private let progressValue: CGFloat
  private let total: CGFloat
  
  init(progressValue: CGFloat, total: CGFloat) {
    self.progressValue = progressValue
    self.total = total
  }
  
  var body: some View {
    ZStack {
      ProgressView(
        "현재 진행률: \(Int(progressValue)) / 20",
        value: progressValue,
        total: total
      )
      .tint(.blueLemonAde)
      .foregroundColor(.deepPurple)
    }
  }
}

#Preview {
  MBTITestProgressView(progressValue: 1, total: 20)
}

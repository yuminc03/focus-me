import SwiftUI

extension View {
  func fmAlert<Content: View>(
    isPresented: Binding<Bool>,
    @ViewBuilder content: () -> Content
  ) -> some View {
    self
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .overlay {
        FMAlert(isPresented: isPresented, content: content)
      }
  }
}

struct FMAlert<Content: View>: View {
  @Binding var isPresented: Bool
  @ViewBuilder let content: Content
  
  var body: some View {
    ZStack {
      if isPresented {
        Color.black
          .opacity(0.6)
          .ignoresSafeArea()
        
        VStack(spacing: 0) {
          content
        }
        .padding(.top, 30)
        .padding([.bottom, .horizontal], 10)
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(10)
        .padding(.horizontal, 20)
        .transition(.asymmetric(
          insertion: .move(edge: .bottom),
          removal: .move(edge: .bottom)
        ))
      }
    }
    .animation(.easeInOut(duration: 0.5), value: isPresented)
  }
}

#Preview {
  FMAlert(isPresented: .constant(true)) {
    FMAlertContainer {
      FMDefaultAlert(title: "제목", message: "메시지입니다.")
    }
    .addButton(type: .cancel, buttonStyle: .cancel(title: "취소")) {
      print("Cancel")
    }
    .addButton(type: .confirm, buttonStyle: .primary(title: "확인")) {
      print("primary")
    }
  }
}

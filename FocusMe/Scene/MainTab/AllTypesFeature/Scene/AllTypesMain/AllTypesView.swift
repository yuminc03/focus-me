import SwiftUI

import ComposableArchitecture

/// 모든 MBTI 유형들을 소개하는 화면
struct AllTypesView: View {
  @Perception.Bindable private var store: StoreOf<AllTypesCore>
  
  private let columns = [
    GridItem(.flexible(), spacing: 20, alignment: .center),
    GridItem(.flexible(), spacing: 20, alignment: .center)
  ]
  
  init(store: StoreOf<AllTypesCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(store.types, id: \.rawValue) { type in
            TypesGridRow(type: type)
              .onTapGesture {
                store.send(.tapGridRow(type))
              }
          }
        }
        .padding([.top, .horizontal], 20)
      }
      .backgroundColor()
      .fmNavigation(title: "MBTI 유형들") {
        store.send(.tapBackButton)
      }
      .onAppear {
        NotiManager.post(key: .hideTab)
      }
    }
  }
}

#Preview {
  AllTypesView(store: .init(initialState: AllTypesCore.State()) {
    AllTypesCore()
  })
}

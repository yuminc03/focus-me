import SwiftUI

import ComposableArchitecture

@Reducer
struct AllTypesCore {
  @ObservableState
  struct State: Equatable {
    let id = UUID()
    let types = MBTI.allCases
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

/// 모든 MBTI 유형들을 소개하는 화면
struct AllTypesView: View {
  @Perception.Bindable private var store: StoreOf<AllTypesCore>
  
  private let columns = [
    GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 10, alignment: .center),
    GridItem(.adaptive(minimum: 150, maximum: 180), spacing: 10, alignment: .center)
  ]
  
  init(store: StoreOf<AllTypesCore>) {
    self.store = store
  }
  
  var body: some View {
    WithPerceptionTracking {
      ScrollView {
        LazyVGrid(columns: columns, spacing: 20) {
          ForEach(store.types, id: \.rawValue) {
            TypesGridRow(type: $0)
          }
        }
        .padding(.top, 20)
      }
      .backgroundColor()
      .navigationTitle("MBTI 유형들")
    }
  }
}

#Preview {
  NavigationStack {
    AllTypesView(store: .init(initialState: AllTypesCore.State()) {
      AllTypesCore()
    })
  }
}

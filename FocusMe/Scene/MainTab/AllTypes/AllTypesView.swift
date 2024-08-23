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
    case delegate(Delegate)
    case tapBackButton
    
    enum Delegate {
      case back
    }
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate: break
      case .tapBackButton:
        return .send(.delegate(.back))
      }
      
      return .none
    }
  }
}

/// 모든 MBTI 유형들을 소개하는 화면
struct AllTypesView: View {
  @Perception.Bindable private var store: StoreOf<AllTypesCore>
  
  private let columns = [
    GridItem(.flexible(), spacing: 10, alignment: .center),
    GridItem(.flexible(), spacing: 10, alignment: .center)
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

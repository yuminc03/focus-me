//
//  JudgingIntroView.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture

struct JudgingIntroCore: Reducer {
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

struct JudgingIntroView: View {
  private let store: StoreOf<JudgingIntroCore>
  @ObservedObject private var viewStore: ViewStoreOf<JudgingIntroCore>
  
  init(store: StoreOf<JudgingIntroCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  JudgingIntroView(store: .init(initialState: JudgingIntroCore.State()) {
    JudgingIntroCore()
  })
}

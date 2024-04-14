//
//  FeelingIntroView.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture

struct FeelingIntroCore: Reducer {
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

struct FeelingIntroView: View {
  private let store: StoreOf<FeelingIntroCore>
  @ObservedObject private var viewStore: ViewStoreOf<FeelingIntroCore>
  
  init(store: StoreOf<FeelingIntroCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  FeelingIntroView(store: .init(initialState: FeelingIntroCore.State()) {
    FeelingIntroCore()
  })
}

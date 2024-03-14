//
//  RootView.swift
//  MySelf
//
//  Created by Yumin Chu on 3/14/24.
//

import SwiftUI

import ComposableArchitecture

struct RootCore: Reducer {
  struct State: Equatable {
    let id = UUID()
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
  }
}

struct RootView: View {
  private let store: StoreOf<RootCore>
  @ObservedObject private var viewStore: ViewStoreOf<RootCore>
  
  init(store: StoreOf<RootCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  var body: some View {
    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
  }
}

#Preview {
  RootView(store: .init(initialState: RootCore.State()) {
    RootCore()
  })
}

//
//  PagingScrollView.swift
//  MySelf
//
//  Created by Yumin Chu on 3/17/24.
//

import SwiftUI

import ComposableArchitecture

@Reducer
struct PagingScrollCore {
  struct State: Equatable {
    
  }
  
  enum Action: Equatable {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      return .none
    }
  }
}

struct PagingScrollView: View {
  private let store: StoreOf<PagingScrollCore>
  @ObservedObject private var viewStore: ViewStoreOf<PagingScrollCore>
  
  init(store: StoreOf<PagingScrollCore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
  var body: some View {
    Text("")
  }
}


#Preview {
  PagingScrollView(store: .init(initialState: PagingScrollCore.State()) {
    PagingScrollCore()
  })
}

extension PagingScrollView {
  
}

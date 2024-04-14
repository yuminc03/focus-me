//
//  IntuitionIntroView.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture

struct IntuitionIntroCore: Reducer {
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

struct IntuitionIntroView: View {
  let store: StoreOf<IntuitionIntroCore>
  @ObservedObject var viewStore: ViewStoreOf<IntuitionIntroCore>
  
  init(store: StoreOf<IntuitionIntroCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  var body: some View {
    Text("Hello, World!")
  }
}

#Preview {
  IntuitionIntroView(store: .init(initialState: IntuitionIntroCore.State()) {
    IntuitionIntroCore()
  })
}

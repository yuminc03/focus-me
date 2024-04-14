//
//  IntrovertIntroView.swift
//  MySelf
//
//  Created by Yumin Chu on 4/14/24.
//

import SwiftUI

import ComposableArchitecture

struct IntrovertIntroCore: Reducer {
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

struct IntrovertIntroView: View {
  private let store: StoreOf<IntrovertIntroCore>
  @ObservedObject private var viewStore: ViewStoreOf<IntrovertIntroCore>
  
  init(store: StoreOf<IntrovertIntroCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  var body: some View {
    Text("")
  }
}

#Preview {
  IntrovertIntroView(store: .init(initialState: IntrovertIntroCore.State()) {
    IntrovertIntroCore()
  })
}

//
//  AppView.swift
//  MySelf
//
//  Created by Yumin Chu on 2/18/24.
//

import SwiftUI

import ComposableArchitecture
import TCACoordinators

struct AppCore: Reducer {
  struct State: Equatable {
    
  }
  
  enum Page: Hashable {
    case me
    case inside
    case outside
  }
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      default:
        break
      }
      
      return .none
    }
  }
}

struct AppView: View {
  private let store: StoreOf<AppCore>
  @ObservedObject private var viewStore: ViewStoreOf<AppCore>
  
  init(store: StoreOf<AppCore>) {
    self.store = store
    self.viewStore = .init(store, observe: { $0 })
  }
  
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundStyle(.tint)
      Text("Hello, world!")
    }
    .padding()
  }
}

#Preview {
  AppView(store: .init(initialState: AppCore.State()) {
    AppCore()
  })
}

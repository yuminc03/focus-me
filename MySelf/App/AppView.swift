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
  
  enum Action {
    
  }
  
  var body: some ReducerOf<Self> {
    EmptyReducer()
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
    VStack(alignment: .leading, spacing: 20) {
      titleLabel
    }
  }
}

#Preview {
  AppView(store: .init(initialState: AppCore.State()) {
    AppCore()
  })
}

extension AppView {
  private var titleLabel: some View {
    Text("안녕하십니까!")
      .foregroundColor(Color(R.color.bgColor))
  }
}

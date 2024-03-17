//
//  RootView.swift
//  MySelf
//
//  Created by Yumin Chu on 3/14/24.
//

import SwiftUI

import ComposableArchitecture

@Reducer
struct RootCore {
  struct State: Equatable {
    let id = UUID()
    let numberOfPages = 3
    @BindingState var currentPage = 0
  }
  
  enum Action: BindableAction, Equatable {
    case binding(BindingAction<State>)
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        break
      }
      
      return .none
    }
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
    ZStack {
      pageControl
      pagingView
    }
  }
}

#Preview {
  RootView(store: .init(initialState: RootCore.State()) {
    RootCore()
  })
}

extension RootView {
  private var pageControl: some View {
    HStack(spacing: 0) {
      RepresentedPageControl(
        numberOfPage: viewStore.numberOfPages,
        currentPage: viewStore.$currentPage
      )
      .foregroundColor(.blue)
      .aspectRatio(3 / 2, contentMode: .fit)
      .frame(width: 165, height: 42)
      Spacer()
    }
  }
  
  private var pagingView: some View {
    GeometryReader { geometry in
      
    }
  }
}

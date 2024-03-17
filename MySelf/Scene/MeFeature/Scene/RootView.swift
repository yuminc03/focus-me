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
    let cards: [Card] = [
      .init(
        title: "Introvert",
        subTitle: "혼자 있고 싶은 나"
      ),
      .init(
        title: "Intuition",
        subTitle: "이상적이고 예측하는 능력이 있는 나"
      ),
      .init(
        title: "Feeling",
        subTitle: "상대방의 기분을 잘 알아차리고 위로를 잘 할 수 있는 나"
      ),
      .init(
        title: "Judging",
        subTitle: "일을 시작하기 전 미리 계획하고 순서를 정하는 나"
      )
    ]
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

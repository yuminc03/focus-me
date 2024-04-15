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
    let cards = Card.dummy
    @BindingState var currentPage = CardType.introvert.rawValue + 1
  }
  
  private enum CardType: Int {
    case introvert
    case intuition
    case feeling
    case judging
  }
  
  enum Action: BindableAction, Equatable {
    case binding(BindingAction<State>)
    case changePage(Int)
  }
  
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        break
        
      case let .changePage(index):
        state.currentPage = index
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
      Color.black
        .ignoresSafeArea()
      VStack(alignment: .center, spacing: 25) {
        pageControl
        pagingView
        Spacer()
        continueButton
      }
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
      CustomPageIndicator(
        selectedIndex: (viewStore.currentPage == 0) ?
        3 : (viewStore.currentPage == 5) ?
        1 : viewStore.currentPage - 1,
        maxCount: viewStore.cards.count - 2
      )
      Spacer()
    }
    .padding(20)
  }
  
  private var pagingView: some View {
    TabView(selection: viewStore.$currentPage) {
      ForEach(0 ..< viewStore.cards.count, id: \.self) {
        CardItem(cardInfo: viewStore.cards[$0])
          .tag($0)
          .frame(width: UIScreen.main.bounds.width - 40)
      }
    }
    .onChange(of: viewStore.currentPage) { newValue in
      if newValue == 0 {
        store.send(.changePage(4))
      } else if newValue == 5 {
        store.send(.changePage(1))
      }
    }
    .tabViewStyle(.page(indexDisplayMode: .never))
  }
  
  private var continueButton: some View {
    Button {
      
    } label: {
      contnueButtonLabel
    }
  }
  
  private var contnueButtonLabel: some View {
    HStack {
      Image(systemName: "paperplane.fill")
        .frame(width: 20, height: 20)
      Text("계속하기")
        .font(.custom(R.font.notoSansKRMedium, size: 20))
        .padding(10)
    }
    .foregroundColor(.white)
    .padding(10)
    .background(LinearGradient(
      colors: [.purple, .blue],
      startPoint: .topLeading,
      endPoint: .bottomTrailing
    ))
    .clipShape(Capsule())
  }
}

import Foundation
import Combine

final class StateManager: ObservableObject {
  @Published private(set) var isTabBarPresented = false
  
  private var cancelBag = Set<AnyCancellable>()
  
  init() {
    NotiManager.publisher(key: .hideTab)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        self?.isTabBarPresented = false
      }
      .store(in: &cancelBag)
    
    NotiManager.publisher(key: .showTab)
      .receive(on: DispatchQueue.main)
      .sink { [weak self] _ in
        self?.isTabBarPresented = true
      }
      .store(in: &cancelBag)
  }
}

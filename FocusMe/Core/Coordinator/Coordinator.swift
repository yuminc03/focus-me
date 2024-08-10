import Foundation

final class Coordinator: ObservableObject {
  @Published var route: [Destination] = []
  
  func push(destination: Destination) {
    route.append(destination)
  }
  
  func pop() {
    route.removeLast()
  }
  
  func popToRoot() {
    route.removeAll()
  }
}

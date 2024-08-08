import SwiftUI

@main
struct MySelfApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        LoginView()
      }
    }
  }
}

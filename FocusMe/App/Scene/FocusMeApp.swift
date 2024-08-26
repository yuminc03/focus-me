import SwiftUI

@main
struct FocusMeApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  
  var body: some Scene {
    WindowGroup {
      AppView(store: .init(initialState: .initialState) {
        AppCore()
      })
    }
  }
}

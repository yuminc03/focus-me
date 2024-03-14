//
//  MySelfApp.swift
//  MySelf
//
//  Created by Yumin Chu on 2/18/24.
//

import SwiftUI

@main
struct MySelfApp: App {
  var body: some Scene {
    WindowGroup {
      AppView(store: .init(initialState: AppCore.State()) {
        AppCore()
      })
    }
  }
}

//
//  main.swift
//  WindowAnimation
//
//  Created by 秋星桥 on 2024/10/22.
//

import SwiftUI
import WindowAnimation

struct ExampleApp: App {
    var body: some Scene {
        WindowAnimationResizeGroup {
            ContentView()
        }
        .windowStyle(.hiddenTitleBar)
    }
}

ExampleApp.main()

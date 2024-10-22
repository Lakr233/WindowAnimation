//
//  WindowAnimationResizeGroup.swift
//  WindowAnimation
//
//  Created by 秋星桥 on 2024/10/23.
//

import SwiftUI

@available(macOS 13.0, *)
public struct WindowAnimationResizeGroup<Content: View>: Scene {
    private let speed: Double
    private let alignment: Alignment
    private let content: () -> Content

    public init(
        speed: Double = WindowAnimation.defaultSpeed,
        alignment: Alignment = WindowAnimation.defaultAlignment,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.speed = speed
        self.alignment = alignment
        self.content = content
    }

    public var body: some Scene {
        WindowGroup {
            content()
                .modifier(WindowAnimationModifier(speed: speed))
        }
        .windowResizability(.contentSize)
    }
}

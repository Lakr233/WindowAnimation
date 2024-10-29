// The Swift Programming Language
// https://docs.swift.org/swift-book

import MSDisplayLink
import SpringInterpolation
import SwiftUI

public struct WindowAnimationModifier: ViewModifier {
    let speed: Double
    let alignment: Alignment

    @State var springInterpolation: SpringInterpolation2D
    @State var lastUpdate = Date()
    @State var requiresUpdate = false

    public init(
        speed: Double = WindowAnimation.defaultSpeed,
        alignment: Alignment = WindowAnimation.defaultAlignment,
        animation: SpringInterpolation.Configuration = WindowAnimation.defaultAnimation
    ) {
        self.speed = speed
        self.alignment = alignment

        _springInterpolation = .init(initialValue: .init(animation))
    }

    public func body(content: Content) -> some View {
        content
            .background(ViewFrameReader { updateSize($0.size) })
            .frame(
                width: ceil(springInterpolation.x.value),
                height: ceil(springInterpolation.y.value),
                alignment: alignment
            )
            .fixedSize()
            .modifier(DisplayLinkModifier(scheduleToMainThread: true) { tik() })
    }

    private func updateSize(_ size: CGSize) {
        let target = SpringInterpolation2D.Vec2D(x: size.width, y: size.height)
        if ceil(abs(springInterpolation.x.value.distance(to: 0))) <= springInterpolation.x.config.threshold,
           ceil(abs(springInterpolation.y.value.distance(to: 0))) <= springInterpolation.y.config.threshold
        {
            springInterpolation.setCurrent(target)
        }
        springInterpolation.setTarget(target)
        requiresUpdate = true
        lastUpdate = .init()
    }

    private func tik() {
        guard requiresUpdate else { return }
        defer { lastUpdate = .init() }
        let deltaTime = Date().timeIntervalSince(lastUpdate)
        springInterpolation.update(withDeltaTime: deltaTime * speed)
        if springInterpolation.completed {
            springInterpolation.setCurrent(.init(
                x: springInterpolation.x.context.targetPos,
                y: springInterpolation.y.context.targetPos
            ))
            requiresUpdate = false
        }
    }
}

private extension SpringInterpolation {
    var completed: Bool {
        ceil(abs(context.currentPos.distance(to: context.targetPos))) <= config.threshold
    }
}

private extension SpringInterpolation2D {
    var completed: Bool {
        x.completed && y.completed
    }
}

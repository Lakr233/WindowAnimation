//
//  WindowAnimation.swift
//  WindowAnimation
//
//  Created by 秋星桥 on 2024/10/23.
//

import SpringInterpolation
import SwiftUI

public enum WindowAnimation {
    // factor for delta time
    public static var defaultSpeed: Double = 4.0

    // window usually expend from top to bottom left to right
    // in up left coordinate system
    public static var defaultAlignment: Alignment = .top

    // control the animation
    public static var defaultAnimation: SpringInterpolation.Configuration = .init(
        angularFrequency: 4,
        dampingRatio: 1,
        // when animated frame value is closing to target frame
        // we stop the animation and set the frame to prevent jitter
        // smaller value give you a precise final touch
        // but may cause bug in some situation
        threshold: 1,
        stopWhenHitTarget: true
    )
}

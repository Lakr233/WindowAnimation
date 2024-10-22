//
//  ViewFrameReader.swift
//  WindowAnimation
//
//  Created by 秋星桥 on 2024/10/22.
//

import Cocoa
import SwiftUI

private class NSViewFrameUpdate: NSView {
    var previousFrame: NSRect = .zero
    var frameChanged: ((NSRect) -> Void)?

    override var frame: NSRect {
        get { super.frame }
        set {
            super.frame = newValue
            defer { previousFrame = newValue }
            if newValue != previousFrame { frameChanged?(newValue) }
        }
    }
}

struct ViewFrameReader: NSViewRepresentable {
    let onViewFrameUpdate: (NSRect) -> Void

    func makeNSView(context _: Context) -> NSView {
        let view = NSViewFrameUpdate()
        view.frameChanged = { onViewFrameUpdate($0) }
        return view
    }

    func updateNSView(_: NSView, context _: Context) {}
}

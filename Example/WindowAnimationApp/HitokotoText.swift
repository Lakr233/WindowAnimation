//
//  HitokotoText.swift
//  WindowAnimationApp
//
//  Created by 秋星桥 on 2024/10/23.
//

import SwiftUI

struct HitokotoText: View {
    let timer = Timer.publish(every: 0.025, on: .main, in: .common).autoconnect()

    @State var text: String = ""
    @State var stash: String

    init(_ text: String) {
        _stash = .init(initialValue: text)
    }

    var body: some View {
        Text(text)
            .textSelection(.enabled)
            .multilineTextAlignment(.leading)
            .contentTransition(.numericText())
            .animation(.spring, value: text)
            .onReceive(timer) { _ in
                if !stash.isEmpty { text += String(stash.removeFirst()) }
            }
    }
}

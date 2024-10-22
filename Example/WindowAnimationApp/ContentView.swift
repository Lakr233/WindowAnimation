//
//  ContentView.swift
//  WindowAnimationApp
//
//  Created by 秋星桥 on 2024/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var list: [Hitokoto] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(list) { hitokoto in
                HitokotoText(hitokoto.content)
            }
            if Hitokoto.list.isEmpty {
            } else {
                Divider().padding(.horizontal, -16)
                    .transition(.opacity)
                Button("Fetch Hitokoto") {
                    meow()
                }
                .transition(.opacity)
            }
        }
        .frame(width: 400, alignment: .leading)
        .animation(.spring, value: list)
        .padding(16)
        .background(.ultraThinMaterial)
    }

    func meow() {
        if let hitokoto = Hitokoto.new() {
            list.append(hitokoto)
        }
    }
}

//
//  Hitokoto.swift
//  WindowAnimationApp
//
//  Created by 秋星桥 on 2024/10/23.
//

import Foundation

struct Hitokoto: Identifiable, Equatable {
    var id = UUID()
    var content: String

    static func new() -> Hitokoto? {
        if list.isEmpty { return nil }
        return list.removeFirst()
    }
}

extension Hitokoto {
    static var list: [Hitokoto] = [
        .init(content: "若遗憾是遗憾 若故事没说完"),
        .init(content: "回头看 梨花已落千山"),
        .init(content: "我至少听过 你说的喜欢"),
        .init(content: "像涓涓温柔途经过百川"),
        .init(content: "若遗憾遗憾 若心酸心酸"),
        .init(content: "又不是非要圆满"),
        .init(content: "来年秋风乱 笑看红叶转"),
        .init(content: "深情 只好 浅谈"),
    ]
}

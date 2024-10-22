// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WindowAnimation",
    platforms: [
        .macOS(.v11),
    ],
    products: [
        .library(name: "WindowAnimation", targets: ["WindowAnimation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Lakr233/MSDisplayLink.git", from: "1.1.1"),
        .package(url: "https://github.com/Lakr233/SpringInterpolation.git", from: "1.2.2"),
    ],
    targets: [
        .target(name: "WindowAnimation", dependencies: [
            "MSDisplayLink",
            "SpringInterpolation",
        ]),
    ]
)

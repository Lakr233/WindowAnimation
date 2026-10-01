// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WindowAnimation",
    platforms: [
        .macOS(.v12),
    ],
    products: [
        .library(name: "WindowAnimation", targets: ["WindowAnimation"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Lakr233/DisplayLink.git", from: "3.0.0"),
        .package(url: "https://github.com/Lakr233/SpringInterpolation.git", from: "1.3.1"),
    ],
    targets: [
        .target(name: "WindowAnimation", dependencies: [
            "DisplayLink",
            "SpringInterpolation",
        ]),
    ],
    swiftLanguageModes: [.v5]
)

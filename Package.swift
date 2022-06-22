// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "lively",
    platforms: [
        .macOS(.v10_10), .iOS(.v14)
    ],
    products: [
        .library(
            name: "lively",
            targets: ["lively", "livelyc"]),
    ],
    dependencies: [
        .package(url: "https://github.com/awxkee/webp.swift.git", branch: "master"),
        .package(url: "https://github.com/awxkee/avif.swift.git", branch: "master")
    ],
    targets: [
        .target(
            name: "lively", dependencies: ["livelyc"]),
        .target(name: "livelyc",
                dependencies: [.product(name: "webp", package: "webp.swift"),
                               .product(name: "avif", package: "avif.swift")],
                publicHeadersPath: ".",
                cSettings: [
                    .headerSearchPath("."),
                ]),
        .testTarget(
            name: "livelyTests",
            dependencies: ["lively"]),
    ]
)

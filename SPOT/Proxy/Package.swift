// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Proxy",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "TCAProxy",
            targets: ["TCAProxy"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "TCAProxy",
            dependencies: [
            ]
        )
    ]
)

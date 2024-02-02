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
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", exact: "1.7.2")
    ],
    targets: [
        .target(
            name: "TCAProxy",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture")
            ]
        )
    ]
)

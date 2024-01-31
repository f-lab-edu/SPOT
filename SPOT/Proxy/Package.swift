// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Proxy",
    products: [
        .library(
            name: "DependenciesWrapper",
            targets: ["DependenciesWrapper"]),
    ],
    dependencies: [
//        .package(url: "https://github.com/pointfreeco/swift-dependencies", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "DependenciesWrapper",
            dependencies: [
//                .product(name: "Dependencies", package: "swift-dependencies")
            ]
        )
    ]
)

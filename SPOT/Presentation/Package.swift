// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Presentation",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Root",
            targets: ["Root"]),
        .library(
            name: "LocationFeature",
            targets: ["LocationFeature"])
    ],
    dependencies: [
        .package(path: "../Proxy")
    ],
    targets: [
        .target(
            name: "Root",
            dependencies: [
            ]),
        .target(
            name: "LocationFeature",
            dependencies: [
                .product(name: "TCAProxy", package: "Proxy")
            ]),
        .testTarget(
            name: "LocationFeatureTests",
            dependencies: ["LocationFeature"]),
    ]
)

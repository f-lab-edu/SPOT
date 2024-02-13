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
            name: "RunningFeature",
            targets: ["RunningFeature"]),
        .library(
            name: "LocationFeature",
            targets: ["LocationFeature"]),
        .library(
            name: "ActivityFeature",
            targets: ["ActivityFeature"])
    ],
    dependencies: [
        .package(path: "../Domain")
    ],
    targets: [
        .target(
            name: "Root",
            dependencies: [
                "RunningFeature"
            ]),
        .target(
            name: "RunningFeature",
            dependencies: [
                "LocationFeature",
                "ActivityFeature",
                .product(name: "Usecase", package: "Domain")
            ]),
        .target(
            name: "LocationFeature",
            dependencies: [
                .product(name: "Usecase", package: "Domain")
            ]),
        .target(
            name: "ActivityFeature",
            dependencies: [
                .product(name: "Usecase", package: "Domain")
            ]),
        .testTarget(
            name: "LocationFeatureTests",
            dependencies: ["LocationFeature"]),
    ]
)

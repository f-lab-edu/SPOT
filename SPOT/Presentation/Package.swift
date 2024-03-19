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
            name: "AuthFeature",
            targets: ["AuthFeature"]),
        .library(
            name: "RecordsFeature",
            targets: ["RecordsFeature"])
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
                .product(name: "Usecase", package: "Domain")
            ]),
        .target(
            name: "AuthFeature",
            dependencies: [
                .product(name: "Usecase", package: "Domain")
            ]),
        .target(
            name: "RecordsFeature",
            dependencies: [
                .product(name: "Usecase", package: "Domain")
            ]),
        .testTarget(
            name: "RunningFeatureTests",
            dependencies: []),
    ]
)

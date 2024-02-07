// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Usecase",
            targets: ["Usecase"]),
        .library(
            name: "Controller",
            targets: ["Controller"]),
        .library(
            name: "Entity",
            targets: ["Entity"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Usecase",
            dependencies: [
                "Controller"
            ]
        ),
        .target(
            name: "Controller",
            dependencies: [
                "Entity"
            ]
        ),
        .target(
            name: "Entity",
            dependencies: []
        ),
        .testTarget(
            name: "UsecaseTests",
            dependencies: []),
    ]
)

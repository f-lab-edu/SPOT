// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "Running",
            targets: ["Running"]),
    ],
    dependencies: [
        .package(path: "../DataAccess")
    ],
    targets: [
        .target(
            name: "Running",
            dependencies: [
                .product(name: "RunningDataAccess", package: "DataAccess")
            ]
        ),
        .testTarget(
            name: "RunningTests",
            dependencies: ["Running"]),
    ]
)

// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataAccess",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "RunningDataAccess",
            targets: ["RunningDataAccess"]),
    ],
    dependencies: [
        .package(path: "../Proxy")
    ],
    targets: [
        .target(
            name: "RunningDataAccess",
            dependencies: [
                .product(name: "DependenciesWrapper", package: "Proxy")
            ]
        )
    ]
)

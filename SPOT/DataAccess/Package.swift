// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DataAccess",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "DataAccess",
            targets: ["DataAccess"]),
    ],
    dependencies: [
        .package(name: "Proxy", path: "../../Proxy")
    ],
    targets: [
        .target(
            name: "DataAccess",
            dependencies: [
                .product(name: "DependenciesWrapper", package: "Proxy")
            ]
        ),
        .testTarget(
            name: "DataAccessTests",
            dependencies: ["DataAccess"]),
    ]
)

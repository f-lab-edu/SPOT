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
        .library(
            name: "AuthDataAccess",
            targets: ["AuthDataAccess"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Proxy")
    ],
    targets: [
        .target(
            name: "RunningDataAccess",
            dependencies: [
                .product(name: "Controller", package: "Domain")
            ]
        ),
        .target(
            name: "AuthDataAccess",
            dependencies: [
                .product(name: "Controller", package: "Domain"),
                .product(name: "KakaoLoginProxy", package: "Proxy"),
                .product(name: "GoogleLoginProxy", package: "Proxy")
            ]
        )
    ]
)

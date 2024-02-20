// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Proxy",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "KakaoLoginProxy",
            targets: ["KakaoLoginProxy"]),
        .library(
            name: "GoogleLoginProxy",
            targets: ["GoogleLoginProxy"])
    ],
    dependencies: [
        .package(url: "https://github.com/kakao/kakao-ios-sdk", .upToNextMajor(from: "2.20.0")),
        .package(url: "https://github.com/google/GoogleSignIn-iOS", .upToNextMajor(from: "7.0.0"))
    ],
    targets: [
        .target(
            name: "KakaoLoginProxy",
            dependencies: [
                .product(name: "KakaoSDKUser", package: "kakao-ios-sdk"),
                .product(name: "KakaoSDKAuth", package: "kakao-ios-sdk"),
                .product(name: "KakaoSDKCommon", package: "kakao-ios-sdk")
            ]
        ),
        .target(
            name: "GoogleLoginProxy",
            dependencies: [
                .product(name: "GoogleSignIn", package: "GoogleSignIn-iOS"),
                .product(name: "GoogleSignInSwift", package: "GoogleSignIn-iOS")
            ]
        )
    ]
)

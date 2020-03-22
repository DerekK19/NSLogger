// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "NSLoggerSwift",
    platforms: [
        .iOS(.v8),
        .tvOS(.v9),
        .macOS(.v10_10)
    ],
    products: [
        .library(
            name: "NSLogger",
            type: .dynamic,
            targets: ["NSLogger"]),
        .library(
            name: "NSLoggerSwift",
            type: .dynamic,
            targets: ["NSLoggerSwift"]),
    ],
    targets: [
        .target(
            name: "NSLogger",
            dependencies: [],
            path: "Client/iOS",
            sources: ["LoggerClient.m"],
            publicHeadersPath: "$(SRCROOT)/Client/iOS",
            cSettings: [
                .headerSearchPath("Client/iOS"),
                .unsafeFlags(["-fno-objc-arc", "-Wno-nullability-completeness"]),
            ],
            linkerSettings: [
                .linkedFramework("CFNetwork"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit", .when(platforms: [.iOS])),
                .linkedFramework("AppKit", .when(platforms: [.macOS])),
                .linkedFramework("CoreServices", .when(platforms: [.macOS])),
            ]),
        .target(
            name: "NSLoggerSwift",
            dependencies: ["NSLogger"],
            path: "Client/iOS",
            sources: ["NSLogger.swift"],
            publicHeadersPath: "$(SRCROOT)/Client/iOS"),
    ]
)

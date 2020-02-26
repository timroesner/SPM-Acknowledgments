// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SPM-Acknowledgments",
	platforms: [.iOS("11.0")],
    products: [
        .library(
            name: "SPM-Acknowledgments",
            targets: ["SPM-Acknowledgments"]),
    ],
    targets: [
        .target(
            name: "SPM-Acknowledgments",
            dependencies: []),
        .testTarget(
            name: "SPM-AcknowledgmentsTests",
            dependencies: ["SPM-Acknowledgments"]),
	],
	swiftLanguageVersions: [.v4_2]
)

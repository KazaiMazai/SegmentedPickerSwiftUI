// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SegmentedPicker",
    platforms: [
           .iOS(.v13),
           .macOS(.v10_15),
           .watchOS(.v6),
           .tvOS(.v13)
       ],
    products: [
        .library(
            name: "SegmentedPicker",
            targets: ["SegmentedPicker"])
    ],
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-snapshot-testing",
            from: "1.12.0"
        )

    ],
    targets: [
        .target(
            name: "SegmentedPicker",
            dependencies: []),
        .testTarget(
            name: "SegmentedPickerTests",
            dependencies: [
                "SegmentedPicker",
                .product(name: "SnapshotTesting", package: "swift-snapshot-testing")
            ])
    ]
)

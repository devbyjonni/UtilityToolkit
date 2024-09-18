// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "UtilityToolkit",
    platforms: [
        .macOS(.v11),
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "UtilityToolkit",
            targets: ["UtilityToolkit"]
        ),
    ],
    dependencies: [
        // Add any dependencies here
    ],
    targets: [
        .target(
            name: "UtilityToolkit",
            dependencies: []
        ),
        .testTarget(
            name: "UtilityToolkitTests",
            dependencies: ["UtilityToolkit"]
        ),
    ]
)

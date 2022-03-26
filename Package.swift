// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "DebugPane_Flex",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "DebugPane_Flex",
            targets: ["DebugPane_Flex"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/antranapp/DebugPane",
            .branch("master")
        ),
        .package(
            url: "https://github.com/FLEXTool/FLEX.git",
            .branch("master")
        ),
    ],
    targets: [
        .target(
            name: "DebugPane_Flex",
            dependencies: [
                "DebugPane",
                "FLEX",
            ]
        ),
        .testTarget(
            name: "DebugPane_FlexTests",
            dependencies: ["DebugPane_Flex"]
        ),
    ]
)

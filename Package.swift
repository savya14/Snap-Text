// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "TextExtract",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "TextExtract",
            targets: ["TextExtract"]
        )
    ],
    targets: [
        .executableTarget(
            name: "TextExtract",
            path: "text_extract",
            exclude: [],
            resources: [
                .process("Assets.xcassets")
            ]
        )
    ]
)

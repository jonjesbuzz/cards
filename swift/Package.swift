// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Cards",
    products: [
        .library(name: "Cards", targets: ["Cards"]),
        .executable(name: "cards-swift", targets: ["cards-swift"])
    ],
    targets: [
        .target(name: "Cards"),
        .target(name: "cards-swift", dependencies: ["Cards"]),
        .testTarget(name: "CardsTests", dependencies: ["Cards"])
    ]
)

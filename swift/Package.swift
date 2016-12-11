import PackageDescription

let package = Package(
    name: "Cards",
    targets: [
        Target(name: "Cards"),
        Target(name: "cards-swift", dependencies: ["Cards"])
    ]
)

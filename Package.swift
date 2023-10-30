// swift-tools-version: 5.9
import PackageDescription

let package: Package = .init(
    name: "WrkstrmMain",
    products: [
        .library(name: "WrkstrmMain", targets: ["WrkstrmMain"]),
    ],
    targets: [
        .target(name: "WrkstrmMain"),
        .testTarget(name: "WrkstrmMainTests", dependencies: ["WrkstrmMain"]),
    ]
)

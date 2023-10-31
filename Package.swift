// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "WrkstrmMain",
    platforms: [
      .macOS(.v13),
      .iOS(.v16),
    ],
    products: [
        .library(name: "WrkstrmMain", targets: ["WrkstrmMain"]),
    ],
    targets: [
        .target(name: "WrkstrmMain"),
        .testTarget(name: "WrkstrmMainTests", dependencies: ["WrkstrmMain"]),
    ]
)

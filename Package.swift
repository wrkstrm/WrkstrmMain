// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "WrkstrmMain",
    platforms: [
      .iOS(.v16),
      .macOS(.v13),
      .tvOS(.v16),
      .watchOS(.v9),
    ],
    products: [
        .library(name: "WrkstrmMain", targets: ["WrkstrmMain"]),
    ],
    targets: [
        .target(name: "WrkstrmMain"),
        .testTarget(name: "WrkstrmMainTests", dependencies: ["WrkstrmMain"]),
    ]
)

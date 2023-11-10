// swift-tools-version:5.9
import PackageDescription

extension SwiftSetting {
  static let profile: SwiftSetting = .unsafeFlags([
    "-Xfrontend",
    "-warn-long-expression-type-checking=25",
  ])
}

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
        .target(name: "WrkstrmMain", swiftSettings: [.profile]),
        .testTarget(name: "WrkstrmMainTests", dependencies: ["WrkstrmMain"], swiftSettings: [.profile]),
    ]
)

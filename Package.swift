// PACKAGE_SERVICE_START_V1_HASH:11db95e66d1d051f39a41c1771338342df0a7cc72f7d2f46d33fa2b1041d7f53
import Foundation
// swift-tools-version:5.10
import PackageDescription

// MARK: - Package Declaration

let package = Package(
  name: "WrkstrmMain",
  platforms: [
    .iOS(.v16),
    .macOS(.v13),
    .macCatalyst(.v13),
    .tvOS(.v16),
    .visionOS(.v1),
    .watchOS(.v9),
  ],
  products: [
    .library(name: "WrkstrmMain", targets: ["WrkstrmMain"])
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-testing.git", from: "0.10.0")
  ],
  targets: [
    .target(
      name: "WrkstrmMain",
      swiftSettings: Package.Service.inject.swiftSettings
    ),
    .testTarget(
      name: "WrkstrmMainTests",
      dependencies: [
        "WrkstrmMain",
        .product(name: "Testing", package: "swift-testing"),
      ],
      swiftSettings: Package.Service.inject.swiftSettings
    ),
  ]
)

// MARK: - Package Service

extension Package {
  public struct Service {
    public static let version = "0.0.1"

    public var swiftSettings: [SwiftSetting] = []
    var dependencies: [PackageDescription.Package.Dependency] = []

    public static let inject: Package.Service = ProcessInfo.useLocalDeps ? .local : .remote

    static var local: Package.Service = .init(swiftSettings: [.localSwiftSettings])
    static var remote: Package.Service = .init()
  }
}

// MARK: - PackageDescription extensions

extension SwiftSetting {
  public static let localSwiftSettings: SwiftSetting = .unsafeFlags([
    "-Xfrontend",
    "-warn-long-expression-type-checking=10",
  ])
}

// MARK: - Foundation extensions

extension ProcessInfo {
  public static var useLocalDeps: Bool {
    ProcessInfo.processInfo.environment["SPM_USE_LOCAL_DEPS"] == "true"
  }
}

// PACKAGE_SERVICE_END_V1

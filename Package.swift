// swift-tools-version:6.0
import Foundation
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
  @MainActor
  public struct Inject {
    public static let version = "0.0.1"

    public var swiftSettings: [SwiftSetting] = []
    var dependencies: [PackageDescription.Package.Dependency] = []

    public static let shared: Inject = ProcessInfo.useLocalDeps ? .local : .remote

    static var local: Inject = .init(swiftSettings: [.localSwiftSettings])
    static var remote: Inject = .init()
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

// PACKAGE_SERVICE_END_V0_0_1

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
    .library(name: "WrkstrmMain", targets: ["WrkstrmMain"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-testing.git", from: "0.10.0"),
  ],
  targets: [
    .target(
      name: "WrkstrmMain",
      swiftSettings: ConfigurationService.inject.swiftSettings),
    .testTarget(
      name: "WrkstrmMainTests",
      dependencies: [
        "WrkstrmMain",
        .product(name: "Testing", package: "swift-testing"),
      ],
      swiftSettings: ConfigurationService.inject.swiftSettings),
  ])

// CONFIG_SERVICE_START_V1_HASH:30818bafc27eac3aed5d57b5c82418da73a7a516a68462d16019c2007d34819a
import Foundation

// MARK: - Configuration Service

public struct ConfigurationService {
  public static let version = "0.0.0"

  public var swiftSettings: [SwiftSetting] = []
  var dependencies: [PackageDescription.Package.Dependency] = []

  public static let inject: ConfigurationService = ProcessInfo.useLocalDeps ? .local : .remote

  static var local: ConfigurationService = .init(swiftSettings: [.localSwiftSettings])
  static var remote: ConfigurationService = .init()
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

// CONFIG_SERVICE_END_V1_HASH:{{

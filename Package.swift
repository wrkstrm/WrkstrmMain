// swift-tools-version:5.10
import Foundation
import PackageDescription

// MARK: - Foundation extensions

extension ProcessInfo {
  static var useLocalDeps: Bool {
    ProcessInfo.processInfo.environment["SPM_USE_LOCAL_DEPS"] == "true"
  }
}

// MARK: - PackageDescription extensions

extension SwiftSetting {
  static let localSwiftSettings: SwiftSetting = .unsafeFlags([
    "-Xfrontend",
    "-warn-long-expression-type-checking=10",
  ])
}

// MARK: - Configuration Service

struct ConfigurationService {
  let swiftSettings: [SwiftSetting]

  private static let local: ConfigurationService = .init(swiftSettings: [.localSwiftSettings])

  private static let remote: ConfigurationService = .init(swiftSettings: [])

  static let shared: ConfigurationService = ProcessInfo.useLocalDeps ? .local : .remote
}

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
    .package(url: "https://github.com/apple/swift-testing.git", from: "0.9.0"),
  ],
  targets: [
    .target(
      name: "WrkstrmMain",
      swiftSettings: ConfigurationService.shared.swiftSettings),
    .testTarget(
      name: "WrkstrmMainTests",
      dependencies: [
        "WrkstrmMain",
        .product(name: "Testing", package: "swift-testing"),
      ],
      swiftSettings: ConfigurationService.shared.swiftSettings),
  ])

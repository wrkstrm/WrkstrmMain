/// A small protocol for dependency injection in types.
///
/// Conforming types define a `Resource` and implement `inject(_:)` to receive it
/// along with `assertDependencies()` to validate setup during development/tests.
public protocol Injectable {
  /// The type of resource or dependency that will be injected.
  associatedtype Resource

  /// Injects a resource or dependency into the conforming instance.
  ///
  /// This method is intended to be used for setting or updating the resource or dependency within
  /// the instance.
  /// - Parameter resource: The resource or dependency to be injected.
  func inject(_ resource: Resource)

  /// Asserts that all required dependencies have been injected.
  ///
  /// This method is used to check that all necessary dependencies are present and correctly set.
  /// It's typically called after the injection process is presumed complete, often in a
  /// development or testing context, to ensure that the object is in a valid state with all its
  /// dependencies satisfied.
  func assertDependencies()
}

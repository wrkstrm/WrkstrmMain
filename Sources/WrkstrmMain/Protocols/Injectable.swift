/// A protocol that defines dependency injection behavior for a class or struct.
///
/// Implementing this protocol allows an object to have specific resources or dependencies injected
/// into it. It's typically used in designs where dependencies (like services, data sources, etc.)
/// need to be provided from outside. The protocol defines a method for injecting the dependency 
/// and a method to assert that dependencies are set correctly.
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

/// A protocol representing the ability to flatten values, potentially to `nil`.
///
/// Conforming to `AnyFlattenable` allows for a type to define a way to unwrap or reduce its
/// value(s) to a simpler form, which might be `nil`. This is useful in scenarios where nested
/// optional values or complex data structures need to be simplified.
public protocol AnyFlattenable {
  /// Unwraps and flattens the value to its simplest form, which may be `nil`.
  ///
  /// Implementing this method should involve reducing the value to a non-optional form if possible,
  /// or to `nil` if the value can't be simplified further.
  ///
  /// - Returns: The simplest form of the value as `Any?`, which could be `nil`.
  func flattened() -> Any?
}

/// Extension of `Optional` to conform to `AnyFlattenable`.
///
/// This extension enables any optional value to be flattened, effectively handling nested optionals
/// and reducing them to a single optional layer.
extension Optional: AnyFlattenable {
  /// Flattens the optional value, potentially reducing nested optionals to a single layer.
  ///
  /// For nested optional values (e.g., `Optional<Optional<Type>>`), this method reduces them to a
  /// single optional (`Optional<Type>`). If the value is not an `Optional` or does not conform to
  /// `AnyFlattenable`, it is returned as-is.
  ///
  /// - Returns: The flattened value as `Any?`, which could be a non-optional value, a single-layer
  /// optional, or `nil`.
  public func flattened() -> Any? {
    switch self {
    case .some(let x as AnyFlattenable):
      x.flattened()

    case .some(let x):
      x

    case .none:
      nil
    }
  }
}

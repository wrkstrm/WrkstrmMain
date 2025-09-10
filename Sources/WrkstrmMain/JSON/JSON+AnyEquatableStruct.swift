// Simple wrapper for equatable JSON payloads.

extension JSON {
  /// A struct that can hold any value and conform to `Equatable`.
  /// Useful for dictionary values that need to be compared for equality.
  public struct AnyEquatableStruct: Any, Equatable {}
}

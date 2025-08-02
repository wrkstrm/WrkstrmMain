/// A `CodingKey` implementation that allows for dynamic (string-based) keys
/// when encoding or decoding JSON.
/// Useful for working with dictionaries whose keys are not known at compile time.
public struct DynamicCodingKey: CodingKey {
  /// The string value of the key. Required by `CodingKey`.
  public var stringValue: String
  /// The integer value of the key. Not supported for dynamic keys, always `nil`.
  public var intValue: Int? { nil }

  /// Creates a new `DynamicCodingKey` with a given string value.
  /// - Parameter stringValue: The string representation of the key.
  public init?(stringValue: String) {
    self.stringValue = stringValue
  }

  /// DynamicCodingKey does not support integer keys; always returns `nil`.
  /// - Parameter intValue: The integer representation of the key (ignored).
  public init?(intValue: Int) {
    return nil
  }
}

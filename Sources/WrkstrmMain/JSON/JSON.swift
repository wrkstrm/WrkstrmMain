/// A namespace enum for JSON-related types and utilities.
///
/// `JSON` serves as a namespace for various types that facilitate working with JSON data,
/// such as dictionaries with `String` keys and `Any` or `AnyEquatableStruct` values.
public enum JSON { }

extension JSON {
  /// A type alias representing a dictionary with `String` keys and `Any` values.
  ///
  /// This type is used for representing JSON objects in a flexible manner, allowing for any type of value.
  public typealias AnyDictionary = [String: Any]

  /// A struct that can hold any value and conform to `Equatable`.
  ///
  /// This struct is useful for dictionary values that need to be compared for equality.
  /// As standard Swift `Any` type doesn't conform to `Equatable`, this struct wraps any value and provides 
  /// equatability.
  public struct AnyEquatableStruct: Any, Equatable {}

  /// A type alias for a dictionary with `String` keys and `AnyEquatableStruct` values.
  ///
  /// This type is particularly useful when you need a JSON-like dictionary where the values need to be 
  /// comparable, such as when checking for changes in values or when implementing certain caching
  /// mechanisms.
  public typealias AnyEquatableStructDictionary = [String: AnyEquatableStruct]
}

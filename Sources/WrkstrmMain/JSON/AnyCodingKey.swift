/// A dynamic `CodingKey` capable of representing *any* JSON key, used to inspect
/// keyed containers for unknown or empty objects.
///
/// This type is useful when:
/// - You're decoding a JSON object whose keys are not known in advance.
/// - You want to detect an **empty object** (`{}`) by checking `container.allKeys.isEmpty`.
///
/// This technique is common for safely handling "empty JSON object" cases
/// in Decodable models—for example:
///
/// ```swift
/// let container = try decoder.container(keyedBy: AnyCodingKey.self)
/// if container.allKeys.isEmpty {
///   // This was `{}` -> treat it as "no data"
/// }
/// ```
///
/// See also StackOverflow guidance on detecting empty JSON objects via keyed decoding:
/// https://stackoverflow.com/questions/48943510/swift-codable-decode-empty-json-as-nil-or-empty-object
public struct AnyCodingKey: CodingKey {
  /// The dynamic string value of the key in JSON.
  public var stringValue: String

  /// An empty `intValue` - since JSON keys are strings.
  public var intValue: Int? {
    nil
  }

  /// Initialize with a string key.
  /// Always succeeds unless you want to validate the format yourself.
  public init?(stringValue: String) {
    self.stringValue = stringValue
  }

  /// Not supported — returns `nil`, implying this key cannot be initialized from an integer.
  public init?(intValue: Int) {
    return nil
  }
}

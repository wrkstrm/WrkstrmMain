// Foundation-free enum for representing equatable JSON dictionary shapes.

extension JSON {
  /// An enum representing dictionaries with equatable functionality.
  public enum AnyEquatableDictionaryEnum: Equatable {
    /// Represents a dictionary of type `JSON.AnyDictionary`.
    case any(JSON.AnyDictionary)

    /// Equatability is intentionally coarse here.
    public static func == (_: Self, _: Self) -> Bool { true }
  }
}

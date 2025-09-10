// Foundation-free enum for representing equatable JSON array shapes.

extension JSON {
  /// An enum representing arrays with equatable functionality.
  public enum AnyEquatableArrayEnum: Equatable {
    /// Represents a generic array of `Any` type.
    case any([Any])

    /// Represents an array of dictionaries, with each dictionary conforming to `JSON.AnyDictionary`.
    case dictionary([JSON.AnyDictionary])

    /// Equatability is intentionally coarse here.
    public static func == (_: Self, _: Self) -> Bool { true }
  }
}

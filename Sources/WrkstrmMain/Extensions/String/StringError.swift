/// A simple error type that wraps a string message.
public struct StringError: Error, CustomStringConvertible {
  /// The underlying message for this error.
  public let message: String

  /// Creates a new `StringError` with the provided message.
  /// - Parameter message: The error message to wrap.
  public init(_ message: String) {
    self.message = message
  }

  /// A textual representation of the error message.
  public var description: String { message }
}

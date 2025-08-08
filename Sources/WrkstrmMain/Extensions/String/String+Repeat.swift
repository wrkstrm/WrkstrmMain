/// An extension on `String` providing a multiplication operator to repeat strings.
extension String {
  /// Repeats the string a specified number of times using the `*` operator.
  ///
  /// Example:
  ///
  /// ```swift
  /// let laugh = "ha" * 3
  /// // laugh == "hahaha"
  /// ```
  ///
  /// - Parameters:
  ///   - left: The string to repeat.
  ///   - right: The number of times to repeat the string. Must be non-negative.
  /// - Returns: A new string consisting of `left` repeated `right` times.
  public static func * (left: String, right: Int) -> String {
    String(repeating: left, count: right)
  }
}

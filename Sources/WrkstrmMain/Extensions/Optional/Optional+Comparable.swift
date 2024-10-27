/// Extension of `Optional` to conform to `Comparable` when the wrapped type is `Equatable` and
/// `Comparable`.
///
/// This extension allows optional values to be compared using the less-than operator (`<`),
/// provided that the wrapped type conforms to `Equatable` and `Comparable`.
/// Comparison logic is as follows:
/// - If both values are non-nil, their wrapped values are compared.
/// - A nil value is always considered less than a non-nil value.
/// - Two nil values are considered equal (not less than each other).
extension Optional: @retroactive Comparable where Wrapped: Equatable & Comparable {
  /// Compares two optional values using the less-than operator.
  ///
  /// The comparison is based on the wrapped values of the optionals. If both optionals are non-nil,
  /// their wrapped values are compared. An optional with a value is always greater than an
  /// optional without a value (nil).
  ///
  /// - Parameters:
  ///   - lhs: An optional value to compare.
  ///   - rhs: Another optional value to compare against.
  /// - Returns: `true` if the value of `lhs` is less than the value of `rhs`; otherwise, `false`.
  public static func < (lhs: Wrapped?, rhs: Wrapped?) -> Bool {
    switch (lhs, rhs) {
      case let (l?, r?):
        l < r

      case (nil, _?):
        true

      default:
        false
    }
  }
}

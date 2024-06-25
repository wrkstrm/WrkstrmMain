/// An extension on `Range` for types conforming to `BinaryFloatingPoint` and `Comparable`.
/// This extension adds a computed property to calculate the magnitude of a range.
extension Range where Bound: BinaryFloatingPoint & Comparable {
  /// The magnitude of the range.
  ///
  /// This computed property returns the difference between the upper and lower bounds of the range.
  /// It is useful for determining the size or extent of the range when working with floating-point
  /// values.
  ///
  /// - Returns: The magnitude of the range as a `Bound` value, representing the distance between
  /// `upperBound` and `lowerBound`.
  public var magnitude: Bound { upperBound - lowerBound }
}

/// An extension on `ClosedRange` for types conforming to `BinaryFloatingPoint` and `Comparable`.
/// This extension adds a computed property to calculate the magnitude of a closed range.
extension ClosedRange where Bound: BinaryFloatingPoint & Comparable {
  /// The magnitude of the closed range.
  ///
  /// This computed property returns the difference between the upper and lower bounds of the closed
  /// range. It is useful for determining the size or extent of the closed range when working with
  /// floating-point values.
  ///
  /// - Returns: The magnitude of the closed range as a `Bound` value, representing the distance
  /// between `upperBound` and `lowerBound`.
  public var magnitude: Bound { upperBound - lowerBound }
}

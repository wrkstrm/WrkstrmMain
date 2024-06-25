/// An extension on `UInt` for bit manipulation utilities.
extension UInt {
  /// Creates a bit mask from an array of bit positions and returns its value.
  ///
  /// This method takes an array of bit positions and sets these bits in a `UInt` value.
  /// Each element in the array represents a bit position (starting from 0). The method creates a
  /// bit mask by setting each of these positions to 1 in the returned `UInt` value.
  ///
  /// For example, `bitSet([0, 3])` will return a `UInt` value where the 0th and 3rd bits are set
  /// (binary 1001).
  ///
  /// - Parameter bits: An array of `UInt` values where each value represents a bit position to set.
  /// - Returns: A `UInt` value representing the bit mask created by setting the specified bit
  /// positions.
  public static func bitSet(_ bits: [UInt]) -> UInt {
    bits.reduce(UInt(0)) { $0 | (1 << $1) }
  }
}

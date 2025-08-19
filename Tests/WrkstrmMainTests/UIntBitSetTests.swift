import Testing

@testable import WrkstrmMain

/// `UInt.bitSet` converts an array of bit positions into a mask.
/// Many features rely on this conversion for flag-based logic, so
/// we guard the helper with focused tests to avoid regressions.
struct UIntBitSetTests {

  /// An empty array should produce zero, ensuring no stray bits are set
  /// when no positions are provided.
  @Test
  func testEmptyArrayProducesZero() {
    #expect(UInt.bitSet([]) == 0)
  }

  /// Setting multiple positions should yield a mask with those bits
  /// so that consumers can rely on precise bit patterns.
  @Test
  func testBitPositionsProduceExpectedMask() {
    #expect(UInt.bitSet([0, 3]) == 0b1001)
  }

  /// The function must be idempotent; duplicate positions shouldn't
  /// change the result. This prevents bugs when callers add the same
  /// flag more than once.
  @Test
  func testRepeatedPositionsDoNotChangeResult() {
    let withDuplicates = UInt.bitSet([0, 3, 3, 0])
    let expected = UInt.bitSet([0, 3])
    #expect(withDuplicates == expected)
  }
}

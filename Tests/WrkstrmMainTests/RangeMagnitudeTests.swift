import Testing

@testable import WrkstrmMain

struct RangeMagnitudeTests {

  // Ensures magnitude accounts for negative and positive bounds
  // by measuring the full width of the range when it crosses zero.
  @Test
  func testRangeCrossingZero() {
    let range: Range<Double> = -1.5..<2.5
    #expect(range.magnitude == 4.0)
  }

  // Validates a closed range with identical bounds reports a
  // magnitude of zero, confirming no width is present.
  @Test
  func testClosedRangeZeroMagnitude() {
    let range: ClosedRange<Double> = 3.0...3.0
    #expect(range.magnitude == 0.0)
  }
}

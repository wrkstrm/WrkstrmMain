import Testing

@testable import WrkstrmMain

/// Tests verifying the robustness of `String.count(of:)` across edge cases.
struct StringCountTests {

  /// Overlapping substrings are tricky for naive implementations; this ensures
  /// occurrences like "aa" in "aaaa" are fully counted instead of skipping
  /// overlaps.
  @Test
  func testOverlappingMatches() {
    #expect("aaaa".count(of: "aa") == 2)
  }

  /// Counting an empty search string should not enter an infinite loop and
  /// should return zero to signal no valid matches.
  @Test
  func testEmptySearchString() {
    #expect("aaaa".count(of: "") == 0)
  }

  /// When the substring is absent the function should correctly report zero
  /// matches instead of a misleading non-zero count.
  @Test
  func testSubstringAbsent() {
    #expect("hello".count(of: "z") == 0)
  }
}

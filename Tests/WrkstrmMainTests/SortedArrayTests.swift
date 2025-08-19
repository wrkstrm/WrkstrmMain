import Testing

@testable import WrkstrmMain

struct SortedArrayTests {
  @Test
  func testInsertAndSearch() {
    var array = SortedArray<Int>(unsorted: [3, 1, 4])
    array.insert(2)
    #expect(array.elements == [1, 2, 3, 4])

    switch array.search(for: 3) {
    case .found(at: let index):
      #expect(index == 2)
    default:
      #expect(false, "expected to find 3")
    }

    switch array.search(for: 5) {
    case .notFound(insertAt: let index):
      #expect(index == 4)
    default:
      #expect(false, "expected not to find 5")
    }
  }

  @Test
  /// Searching an empty array should still return a valid insertion index.
  /// This covers a common edge case and protects callers from off-by-one
  /// errors when they rely on the result of `search`.
  func testSearchEmptyArray() {
    let array = SortedArray<Int>()
    switch array.search(for: 1) {
    case .notFound(insertAt: let index):
      #expect(index == 0)
    default:
      #expect(false, "expected not to find 1 in empty array")
    }
  }

  @Test
  /// Duplicates must be retained in sorted order and reflected in future
  /// searches. This test ensures that inserting a duplicate updates the
  /// reported indices and insert positions.
  func testInsertDuplicatesAffectsSearch() {
    var array = SortedArray<Int>(unsorted: [1, 2, 4])

    switch array.search(for: 4) {
    case .found(at: let index):
      #expect(index == 2)
    default:
      #expect(false, "expected to find 4 before inserting duplicate")
    }

    array.insert(2)
    #expect(array.elements == [1, 2, 2, 4])

    switch array.search(for: 4) {
    case .found(at: let index):
      #expect(index == 3)
    default:
      #expect(false, "expected to find 4 after inserting duplicate")
    }

    switch array.search(for: 3) {
    case .notFound(insertAt: let index):
      #expect(index == 3)
    default:
      #expect(false, "expected not to find 3")
    }
  }

  @Test
  /// `min` and `max` should operate both on populated arrays and gracefully
  /// return `nil` when empty. These assertions catch regressions that could
  /// cause crashes or unexpected defaults.
  func testMinAndMax() {
    var array = SortedArray<Int>(unsorted: [3, 1, 4])
    #expect(array.min() == 1)
    #expect(array.max() == 4)

    array = SortedArray<Int>()
    #expect(array.min() == nil)
    #expect(array.max() == nil)
  }
}

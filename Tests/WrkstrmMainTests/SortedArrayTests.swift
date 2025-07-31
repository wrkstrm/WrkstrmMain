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
}

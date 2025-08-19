import Testing

@testable import WrkstrmMain

struct ArrayFilterTests {

  // Ensures all occurrences of matching values are removed, not just the first.
  @Test
  func testRemovingElementsWithDuplicates() {
    let source = [1, 1, 2, 2, 3, 3]
    let result = source.removing(objectsIn: [2])
    #expect(result == [1, 1, 3, 3])
  }

  // Verifies that providing an empty exclusion array leaves the source unchanged.
  @Test
  func testRemovingWithEmptyOtherArray() {
    let source = [1, 2, 3]
    let result = source.removing(objectsIn: [])
    #expect(result == source)
  }

  // Confirms removing from an empty source returns an empty array instead of crashing.
  @Test
  func testRemovingFromEmptySourceArray() {
    let source: [Int] = []
    let result = source.removing(objectsIn: [1, 2, 3])
    #expect(result.isEmpty)
  }
}

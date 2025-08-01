import Testing

@testable import WrkstrmMain

struct IndexedCollectionTests {

  @Test
  func testIndexedCollection() {
    // Prepare a sample array and its indexed collection
    let sampleArray = ["a", "b", "c"]
    let indexedCollection = IndexedCollection(base: sampleArray)

    // Expected results
    let expectedResults = [(0, "a"), (1, "b"), (2, "c")]

    // Test if indexedCollection contains the correct tuples of index and element
    for (index, element) in indexedCollection {
      #expect(index == expectedResults[index].0)
      #expect(element == expectedResults[index].1)
    }
  }

  @Test
  func testIterationReachesLastElement() {
    let array = [1, 2, 3]
    let collection = IndexedCollection(base: array)

    var lastIndex: Int?
    var lastElement: Int?
    for (index, element) in collection {
      lastIndex = index
      lastElement = element
    }

    #expect(lastIndex == array.index(before: array.endIndex))
    #expect(lastElement == array.last)
  }
}

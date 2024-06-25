import XCTest

@testable import WrkstrmMain

final class IndexedCollectionTests: XCTestCase {
  static var allTests = [("testIndexedCollection", testIndexedCollection)]

  func testIndexedCollection() {
    // Prepare a sample array and its indexed collection
    let sampleArray = ["a", "b", "c"]
    let indexedCollection = IndexedCollection(base: sampleArray)

    // Expected results
    let expectedResults = [(0, "a"), (1, "b"), (2, "c")]

    // Test if indexedCollection contains the correct tuples of index and element
    for (index, element) in indexedCollection {
      XCTAssertEqual(index, expectedResults[index].0, "Index should match expected index.")
      XCTAssertEqual(element, expectedResults[index].1, "Element should match expected element.")
    }
  }
}

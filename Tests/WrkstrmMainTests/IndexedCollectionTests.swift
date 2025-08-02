import Testing

@testable import WrkstrmMain

struct IndexedCollectionTests {

  @Test
  /// Ensures that iteration over an `IndexedCollection` yields
  /// the expected pairs of indices and elements.
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
  /// Validates that iterating over the entire collection updates
  /// the loop variables to the last index and element.
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

  @Test
  /// Checks that `startIndex` and `endIndex` mirror those of the base array.
  func testStartAndEndIndex() {
    let array = [10, 20, 30]
    let collection = IndexedCollection(base: array)

    #expect(collection.startIndex == array.startIndex)
    #expect(collection.endIndex == array.endIndex)
  }

  @Test
  /// Verifies that `index(after:)` and `index(before:)` behave the same as the base.
  func testIndexBeforeAfter() {
    let array = [10, 20, 30]
    let collection = IndexedCollection(base: array)

    let first = array.startIndex
    #expect(collection.index(after: first) == array.index(after: first))

    let last = array.index(before: array.endIndex)
    #expect(collection.index(before: array.endIndex) == last)
  }

  @Test
  /// Ensures that offsetting an index forward and backward matches
  /// the behavior of the base collection.
  func testIndexOffsetBy() {
    let array = [0, 1, 2, 3, 4]
    let collection = IndexedCollection(base: array)

    let forward = collection.index(array.startIndex, offsetBy: 3)
    #expect(forward == array.index(array.startIndex, offsetBy: 3))

    let backward = collection.index(forward, offsetBy: -2)
    #expect(backward == array.index(forward, offsetBy: -2))
  }

  @Test
  /// Checks that subscripting returns a tuple containing the
  /// corresponding index and element from the base collection.
  func testSubscriptAccess() {
    let array = ["zero", "one", "two"]
    let collection = IndexedCollection(base: array)

    let index = array.index(array.startIndex, offsetBy: 1)
    let pair = collection[index]

    #expect(pair.index == index)
    #expect(pair.element == array[index])
  }

  @Test
  /// Confirms that the wrapper exposes the same `count` as its base array.
  func testCountMatchesBase() {
    let array = [1, 2, 3, 4]
    let collection = IndexedCollection(base: array)

    #expect(collection.count == array.count)
  }

  @Test
  /// Ensures that indices from array slices are preserved.
  func testSliceIndices() {
    let array = [0, 1, 2, 3, 4]
    let slice = array[2...4]
    let collection = IndexedCollection(base: slice)

    var expectedIndex = slice.startIndex
    for (index, element) in collection {
      #expect(index == expectedIndex)
      #expect(element == array[index])
      expectedIndex = slice.index(after: expectedIndex)
    }
  }

  @Test
  /// Validates that the `indexed()` extension wraps the collection correctly.
  func testIndexedExtension() {
    let array = ["a", "b", "c"]

    let viaExtension = array.indexed()
    let viaStruct = IndexedCollection(base: array)

    for (lhs, rhs) in zip(viaExtension, viaStruct) {
      #expect(lhs.index == rhs.index)
      #expect(lhs.element == rhs.element)
    }
  }

  @Test
  /// Confirms iteration over an empty collection performs no work.
  func testEmptyCollection() {
    let array: [Int] = []
    let collection = IndexedCollection(base: array)

    #expect(collection.startIndex == collection.endIndex)
    #expect(collection.count == 0)

    var iterated = false
    for _ in collection {
      iterated = true
    }
    #expect(iterated == false)
  }
}

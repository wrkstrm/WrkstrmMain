import Testing

@testable import WrkstrmMain

struct CollectionTests {
  let increasingElements = [1, 3, 5]

  let randomElements = [5, 4, 1, 6, 0, -10]

  // MARK: Binary Search

  // Basic search sanity check on a known-sorted array.
  @Test
  func searchWithIncreasingElements() {
    #expect(increasingElements.search(key: 3) == 1)
  }

  // Searching an empty collection should not crash and must return nil.
  @Test
  func searchInEmptyArray() {
    let empty: [Int] = []
    #expect(empty.search(key: 1) == nil)
  }

  // Missing keys should also yield nil to signal absence.
  @Test
  func searchWithMissingKey() {
    #expect(increasingElements.search(key: 2) == nil)
  }

  // MARK: Merge Sort

  // General merge sort check against a mixed array.
  @Test
  func basicSearch() {
    let sorted = randomElements.mergeSort()
    #expect(sorted == [-10, 0, 1, 4, 5, 6])
  }

  // The base case: a single element should remain unchanged.
  @Test
  func mergeSortWithSingleElement() {
    let single = [42]
    #expect(single.mergeSort() == [42])
  }

  // Already sorted input should stay sorted after running the algorithm.
  @Test
  func mergeSortWithAlreadySortedArray() {
    let sorted = [1, 2, 3]
    #expect(sorted.mergeSort() == [1, 2, 3])
  }

  // A reverse-sorted array is the worst case and must be correctly ordered.
  @Test
  func mergeSortWithReverseSortedArray() {
    let reverseSorted = [3, 2, 1]
    #expect(reverseSorted.mergeSort() == [1, 2, 3])
  }

  // Duplicates should be preserved and ordered relative to each other.
  @Test
  func mergeSortWithDuplicateElements() {
    let duplicates = [3, 1, 2, 1, 3]
    #expect(duplicates.mergeSort() == [1, 1, 2, 3, 3])
  }
}

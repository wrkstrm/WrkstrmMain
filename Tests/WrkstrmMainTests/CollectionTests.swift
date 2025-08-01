import Testing

@testable import WrkstrmMain

struct CollectionTests {
  let increasingElements = [1, 3, 5]

  let randomElements = [5, 4, 1, 6, 0, -10]

  @Test
  func searchWithIncreasingElements() {
    #expect(increasingElements.search(key: 3) == 1)
  }

  @Test
  func basicSearch() {
    let sorted = randomElements.mergeSort()
    #expect(sorted == [-10, 0, 1, 4, 5, 6])
  }
}

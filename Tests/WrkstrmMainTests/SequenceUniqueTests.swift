import Testing

@testable import WrkstrmMain

struct SequenceUniqueTests {

  @Test
  func testUniquePreservesOrder() {
    let input = [3, 1, 2, 3, 2, 1]
    let unique = input.unique()
    #expect(unique == [3, 1, 2])
  }

  @Test
  func testUniqueWithAlreadyUnique() {
    let input = [1, 2, 3]
    let unique = input.unique()
    #expect(unique == input)
  }
}

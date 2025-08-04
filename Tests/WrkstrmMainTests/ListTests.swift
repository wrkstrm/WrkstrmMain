import Testing

@testable import WrkstrmMain

struct ListTests {

  var one = List.single(1, next: nil)

  var two: List<Int> { List.single(2, next: one) }

  @Test
  func testBasicEquality() {
    let first = List.single(1, next: nil)
    #expect(one == first)
  }

  @Test
  func testBasicSingleInequality() {
    let bestNumber = List.single(21, next: nil)
    #expect(!(one == bestNumber))
  }

  @Test
  func testBasicSingleLinkedLoop() {
    let three = List.single(3, next: two)
    let four = List.single(4, next: three)
    let five = List.single(5, next: four)
    #expect(five == five)
  }
}

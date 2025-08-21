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

  @Test
  func testDoubleLinkedEqualityAndReferences() {
    // Ensures doubly linked nodes maintain correct equality and previous/next references,
    // guarding against corrupted links when traversing the list.
    var head = List.double(previous: nil, current: 1, next: nil)
    var tail = List.double(previous: head, current: 2, next: nil)
    head = List.double(previous: nil, current: 1, next: tail)
    tail = List.double(previous: head, current: 2, next: nil)
    let tailCopy = List.double(previous: head, current: 2, next: nil)

    #expect(tail == tailCopy)

    if case .double(let prev, _, let next) = tail {
      #expect(prev == head)
      #expect(next == nil)
    } else {
      Issue.record("expected double list")
    }
  }

  @Test
  func testIteratorNextReturnsNilPastEnd() {
    // Confirms that iterating beyond the final node returns nil, preventing infinite loops.
    let list = two
    var iterator = list.makeIterator()

    _ = iterator.next()
    _ = iterator.next()

    #expect(iterator.next() == nil)
  }
}

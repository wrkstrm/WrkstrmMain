import Testing

@testable import WrkstrmMain

struct OptionalComparableTests {

  let none: Int? = .none

  let one: Int? = 1

  let two: Int? = 2

  @Test
  func testOneLessThanTwo() {
    #expect(one < two)
  }

  @Test
  func testNilLessThanOne() {
    #expect(none < one)
  }

  @Test
  func testOneMoreThanTwoFails() {
    #expect(!(one > two))
  }

  @Test
  func testNilMoreThanOneFails() {
    #expect(!(none > one))
  }

  @Test
  func testNilLessThanNil() {
    #expect(!(none < none))
  }

  @Test
  func testNiGreaterThanNil() {
    #expect(!(none > none))
  }
}

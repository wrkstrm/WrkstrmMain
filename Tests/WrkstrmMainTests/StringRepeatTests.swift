import Testing

@testable import WrkstrmMain

struct StringRepeatTests {

  @Test
  func testMultiplication() {
    #expect("ha" * 3 == "hahaha")
  }

  @Test
  func testZeroMultiplication() {
    #expect("ha" * 0 == "")
  }
}


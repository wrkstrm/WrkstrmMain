@_spi(Experimental) import Testing

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

  #if swift(>=6.2)
  // Guard against undefined behavior by ensuring negative repeat counts
  // trigger a precondition failure rather than silently producing a value.
  @Test
  func testNegativeMultiplication() async {
    await #expect(processExitsWith: .failure) {
      _ = "ha" * -1
    }
  }
  #endif

  // Verifies the repeat algorithm scales for large counts and returns
  // the expected character count.
  @Test
  func testLargeMultiplication() {
    let repeatCount = 1_000
    let result = "ha" * repeatCount
    #expect(result.count == 2 * repeatCount)
  }
}

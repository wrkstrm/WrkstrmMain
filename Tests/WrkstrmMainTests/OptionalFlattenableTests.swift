import Testing

@testable import WrkstrmMain

// These tests guard the behavior of `flattened()` which is used to collapse
// arbitrarily nested optionals and custom `AnyFlattenable` types. Ensuring this
// logic works prevents callers from dealing with unexpected levels of
// optionality or unflattened wrapper types.
struct OptionalFlattenableTests {

  struct Wrapper: AnyFlattenable {
    let value: Any?

    func flattened() -> Any? {
      if let flattenable = value as? AnyFlattenable {
        return flattenable.flattened()
      }
      return value
    }
  }

  // Verifies a basic optional unwraps to its contained value.
  @Test
  func testSingleLevelOptional() {
    let value: Int? = 42
    let flattened = value.flattened() as? Int
    #expect(flattened == 42)
  }

  // Ensures the flattening recurses through multiple optional layers.
  @Test
  func testNestedOptional() {
    let value: Int??? = 42
    let flattened = value.flattened() as? Int
    #expect(flattened == 42)
  }

  // Confirms custom `AnyFlattenable` implementations are also collapsed.
  @Test
  func testCustomAnyFlattenable() {
    let nested: Wrapper? = Wrapper(value: Wrapper(value: 7))
    let flattened = nested.flattened() as? Int
    #expect(flattened == 7)
  }

  // Checks that a `nil` value remains `nil` after flattening.
  @Test
  func testNilValue() {
    let value: Int?? = .some(nil)
    let flattened = value.flattened()
    #expect(flattened == nil)
  }
}

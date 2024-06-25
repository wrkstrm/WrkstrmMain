import XCTest

class StringKebabTests: XCTestCase {
  static var allTests = [
    ("testSimpleCamelCaseToKebabCase", testSimpleCamelCaseToKebabCase),
    ("testAllUppercaseCamelCaseToKebabCase", testAllUppercaseCamelCaseToKebabCase),
    ("testAlreadyKebabCase", testAlreadyKebabCase),
  ]

  func testSimpleCamelCaseToKebabCase() {
    XCTAssertEqual("helloWorld".camelCaseToKebabCase(), "hello-world")
  }

  func testAllUppercaseCamelCaseToKebabCase() {
    XCTAssertEqual("HELLOWORLD".camelCaseToKebabCase(), "h-e-l-l-o-w-o-r-l-d")
  }

  func testAlreadyKebabCase() {
    XCTAssertEqual("kebab-case-example".camelCaseToKebabCase(), "kebab-case-example")
  }
}

import XCTest

class StringKebabTests: XCTestCase {
  
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

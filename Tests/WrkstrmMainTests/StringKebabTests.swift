import Testing

struct StringKebabTests {

  @Test
  func testSimpleCamelCaseToKebabCase() {
    #expect("helloWorld".camelCaseToKebabCase() == "hello-world")
  }

  @Test
  func testAllUppercaseCamelCaseToKebabCase() {
    #expect("HELLOWORLD".camelCaseToKebabCase() == "h-e-l-l-o-w-o-r-l-d")
  }

  @Test
  func testAlreadyKebabCase() {
    #expect("kebab-case-example".camelCaseToKebabCase() == "kebab-case-example")
  }
}

#if !canImport(ObjectiveC)
import XCTest

public func allTests() -> [XCTestCaseEntry] {
  [
    testCase(StringKebabTests.testSimpleCamelCaseToKebabCase),
    testCase(StringKebabTests.testAllUppercaseCamelCaseToKebabCase),
    testCase(StringKebabTests.testAlreadyKebabCase)
  ] +
  [
    testCase(BinaryTreeTests.allTests),
    testCase(ListTests.allTests),
  ]
}
#endif

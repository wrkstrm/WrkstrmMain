#if !canImport(ObjectiveC)
import XCTest

public func allTests() -> [XCTestCaseEntry] {
  [
    testCase(StringExtensionTests.testSimpleCamelCaseToKebabCase),
    testCase(StringExtensionTests.testAllUppercaseCamelCaseToKebabCase),
    testCase(StringExtensionTests.testAlreadyKebabCase)
  ] +
  [
    testCase(BinaryTreeTests.allTests),
    testCase(ListTests.allTests),
  ]
}
#endif

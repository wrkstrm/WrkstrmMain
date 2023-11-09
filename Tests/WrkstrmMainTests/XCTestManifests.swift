#if !canImport(ObjectiveC)
import XCTest

public func allTests() -> [XCTestCaseEntry] {
  [
    testCase(StringKebabTests.allTests),
    testCase(BinaryTreeTests.allTests),
    testCase(ListTests.allTests),
  ]
}
#endif

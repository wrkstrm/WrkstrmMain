#if !canImport(ObjectiveC)
import XCTest

public func allTests() -> [XCTestCaseEntry] {
  [
    testCase(BinaryTreeTests.allTests),
    testCase(ListTests.allTests),
  ]
}
#endif

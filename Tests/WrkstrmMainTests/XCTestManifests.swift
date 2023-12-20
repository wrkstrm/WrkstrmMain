#if !canImport(ObjectiveC)
import XCTest

public func allTests() -> [XCTestCaseEntry] {
  [
    testCase(StringKebabTests.allTests),
    testCase(StringTests.allTests),
    testCase(IndexedCollectionTests.allTests),
    testCase(BinaryTreeTests.allTests),
    testCase(CollectionTests.allTests),
    testCase(OptionalComparableTests.allTests),
    testCase(ListTests.allTests),
  ]
}
#endif

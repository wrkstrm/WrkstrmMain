import XCTest
@testable import WrkstrmMain

final class BrokerageEnvironmentSelectionTagTests: XCTestCase {
    func testTagNameUsesAccountInitial() {
        let sandbox = BrokerageEnvironmentSelectionTag(account: "AccountOne", environment: .sandbox)
        XCTAssertEqual(sandbox.name, "A: Tradier - Sandbox")

        let prod = BrokerageEnvironmentSelectionTag(account: "BlueAccount", environment: .production)
        XCTAssertEqual(prod.name, "B: Tradier - Prod")
    }
}

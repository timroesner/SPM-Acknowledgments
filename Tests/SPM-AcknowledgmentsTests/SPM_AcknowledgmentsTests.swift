import XCTest
@testable import SPM_Acknowledgments

final class SPM_AcknowledgmentsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SPM_Acknowledgments().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SPM_AcknowledgmentsTests.allTests),
    ]
}
#endif

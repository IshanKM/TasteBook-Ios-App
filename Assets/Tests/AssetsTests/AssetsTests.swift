import XCTest
@testable import Assets

final class AssetsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Assets().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}

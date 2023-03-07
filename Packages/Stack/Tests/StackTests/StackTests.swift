import XCTest
@testable import Stack

final class StackTests: XCTestCase {
    
    var stack = Stack()
    
    func testPush() {
        XCTAssertTrue(stack.isEmpty, "Stack should be empty initially")
        stack.push(data: 10)
        XCTAssertEqual(stack.values, [10], "Stack should return [10]")
        stack.push(data: 20)
        XCTAssertEqual(stack.values, [10, 20], "Stack should return [10, 20]")
        stack.push(data: 30)
        XCTAssertEqual(stack.values, [10, 20, 30], "Stack should return [10, 20, 30]")
    }
    
    func testPop() {
        XCTAssertNil(stack.pop(), "Stack should return nil")
        stack.push(data: 10)
        XCTAssertEqual(stack.pop()?.data ?? -1, 10, "Stack should return 10")
        XCTAssertEqual(stack.values, [], "Stack should be empty")
        XCTAssertNil(stack.pop(), "Stack should be nil")
    }
    
}

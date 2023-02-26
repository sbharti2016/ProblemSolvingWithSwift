import XCTest
@testable import LinkedList

final class LinkedListTests: XCTestCase {
    
    private let linkedList = LinkedList()
    
    override func setUp() {
        linkedList.insert(data: 1)
        linkedList.insert(data: 2)
        linkedList.insert(data: 3)
        linkedList.insert(data: 4)
    }
    
    func testInsertionIntoLinkedList() {
        XCTAssertEqual(linkedList.nodes(), [1, 2, 3, 4], "linked list should be [1, 2, 3, 4]")
    }
    
    func testDeletionInEmptyList() {
        let linkedList = LinkedList()
        XCTAssertEqual(linkedList.nodes(), [], "linked list should be []")
        
        let deletedData = linkedList.delete(data: 3)
        XCTAssertNil(deletedData, "Deleted data shouldn be nil")
        XCTAssertEqual(deletedData ?? -1, -1, "Function shluld return nil and should assigned default value of -1 here via ??")
    }
    
    func testDeletionOfRootNode() {
        let deletedData = linkedList.delete(data: 1)
        XCTAssertNotNil(deletedData, "Deleted data shouldn't be nil")
        XCTAssertEqual(deletedData ?? -1, 1, "Deleted data should be 1")
        XCTAssertEqual(linkedList.nodes(), [2, 3, 4], "linked list should be [2, 3, 4]")
    }
    
    func testDeletionOfLastNode() {
        let deletedData = linkedList.delete(data: 4)
        XCTAssertNotNil(deletedData, "Deleted data shouldn't be nil")
        XCTAssertEqual(deletedData ?? -1, 4, "Deleted data should be 1")
        XCTAssertEqual(linkedList.nodes(), [1, 2, 3], "linked list should be [1, 2, 3]")
    }
    
    func testDeletionOfMiddleNode() {
        XCTAssertEqual(linkedList.nodes(), [1, 2, 3, 4], "linked list should be [1, 2, 3, 4]")
        
        let deletedData = linkedList.delete(data: 3)
        XCTAssertNotNil(deletedData, "Deleted data shouldn't be nil")
        XCTAssertEqual(deletedData ?? -1, 3, "Deleted data should be 1")
        XCTAssertEqual(linkedList.nodes(), [1, 2, 4], "linked list should be [1, 2, 3]")
    }
    
    func testDeletionOfAllNodes() {
        let linkedList = LinkedList()
        linkedList.insert(data: 1)
        XCTAssertEqual(linkedList.nodes(), [1], "linked list should be [1]")
        
        let deletedData = linkedList.delete(data: 1)
        XCTAssertNotNil(deletedData, "Deleted data shouldn't be nil")
        XCTAssertEqual(deletedData ?? -1, 1, "Function shluld return nil and should assigned default value of -1 here via ??")
        XCTAssertEqual(linkedList.nodes(), [], "linked list should be []")
    }
    
    func testSearch() {
        XCTAssertEqual(linkedList.Search(1), true, "1 should be present in linked list")
    }
    
    func testInsertionAfterSpecificLocation() {
        linkedList.insert(data: 5, afterData: 1)
        XCTAssertEqual(linkedList.nodes(), [1, 5, 2, 3, 4], "Linked list should have following data [1, 5, 2, 3, 4]")
        linkedList.insert(data: 6, afterData: 4)
        XCTAssertEqual(linkedList.nodes(), [1, 5, 2, 3, 4, 6], "Linked list should have following data [1, 5, 2, 3, 4, 6]")
        linkedList.insert(data: 7, afterData: 3)
        XCTAssertEqual(linkedList.nodes(), [1, 5, 2, 3, 7, 4, 6], "Linked list should have following data [1, 5, 2, 3, 7, 4, 6]")
    }
    
    func testInsertionBeforeSpecificLocation() {
        linkedList.insert(data: 5, beforeData: 1)
        XCTAssertEqual(linkedList.nodes(), [5, 1, 2, 3, 4], "Linked list should have following data [5, 1, 2, 3, 4]")
        linkedList.insert(data: 6, beforeData: 4)
        XCTAssertEqual(linkedList.nodes(), [5, 1, 2, 3, 6, 4], "Linked list should have following data [5, 1, 2, 3, 6, 4]")
        linkedList.insert(data: 7, beforeData: 3)
        XCTAssertEqual(linkedList.nodes(), [5, 1, 2, 7, 3, 6, 4], "Linked list should have following data [5, 1, 2, 7, 3, 6, 4]")
    }
    
    func testReplaceData() {
        linkedList.replace(data: 1, withData: 99)
        XCTAssertEqual(linkedList.nodes(), [99, 2, 3, 4], "linked list should be [99, 2, 3, 4]")
        linkedList.replace(data: 4, withData: 0)
        XCTAssertEqual(linkedList.nodes(), [99, 2, 3, 0], "linked list should be [99, 2, 3, 0]")
        linkedList.replace(data: 66, withData: 0)
        XCTAssertEqual(linkedList.nodes(), [99, 2, 3, 0], "linked list should be [99, 2, 3, 0]")
    }
    
    func testFirst() {
        let node = linkedList.first()
        XCTAssertNotNil(node, "Node shouldn't be nil")
        XCTAssertEqual(node?.data ?? -1, 1, "Current node value should be 1")
    }
    
    func testLast() {
        let node = linkedList.last()
        XCTAssertNotNil(node, "Node shouldn't be nil")
        XCTAssertEqual(node?.data ?? -1, 4, "Current node value should be 1")
    }
    
    func testReverse() {
        XCTAssertEqual(linkedList.nodes(), [1, 2, 3, 4], "linked list should be [1, 2, 3, 4]")
        XCTAssertEqual(linkedList.reverse(), [4, 3, 2, 1], "linked list should be [4, 3, 2, 1]")
    }
}

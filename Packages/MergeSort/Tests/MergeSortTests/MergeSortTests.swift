import XCTest
@testable import MergeSort

final class MergeSortTests: XCTestCase {
    var mergeSort = MergeSort(list: [61, 21, 11, 31, 71, 41])
    
    func testMergeSort() {
        XCTAssertEqual(mergeSort.sorted,
                       [11, 21, 31, 41, 61, 71],
                       "Sorted list should be [11, 21, 31, 41, 61, 71]")
    }
    
}


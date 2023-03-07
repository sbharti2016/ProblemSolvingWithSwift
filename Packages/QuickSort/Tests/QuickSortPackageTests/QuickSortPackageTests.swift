import XCTest
@testable import QuickSortPackage

final class QuickSortPackageTests: XCTestCase {
    
    func testMergeSort() {
        
        XCTAssertEqual(QuickSortPackage().mergeSort([1, 3, 2, 4, 5]),
                       [1, 2, 3, 4, 5],
                       "Sorted list should be [1, 2, 3, 4, 5]")
        
        XCTAssertEqual(QuickSortPackage().mergeSort([-1,0,1,2,-1,-4]),
                       [-4, -1, -1, 0, 1, 2],
                       "Sorted list should be [-4, -1, -1, 0, 1, 2]")
    }
}

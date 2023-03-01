import Foundation
import MergeSort

/*
 Problem Statement: You are given with k number of sorted lists and they need to be merged into single sorted resulant list. 
 For eg. [1, 2, 10], [3, 4, 7], [0] = [0, 1, 2, 3, 4, 7, 10]
 */

func mergeK(lists: [[Int]]) -> [Int] {
    var combinedList = [Int]()
    for list in lists {
        combinedList.append(contentsOf: list)
    }
    return MergeSort(list: combinedList).sorted
}

print("[1, 2, 10], [3, 4, 7], [0]: ", mergeK(lists: [[1, 2, 10], [3, 4, 7], [0]]))


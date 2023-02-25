import Foundation

// Local package is for sorting
import QuickSortPackage

/*
 Problem Statement: Given an list of integers, find all triplets in the list that sum up to a given target value. In other words, given an list arr and a target value target, return all triplets a, b, c such that a + b + c = target.
 for eg.
 
 1. list: [-2, 0, 1, 2, 4, 9] and target = 7::  [[-2, 0, 9], [1, 2, 4]]
 2. list: [-9, -4, 1, 2, 6, 12] and target = 20::  [[2, 6, 12]]
 3. list: [-12, -4, -2, 1, 6, 9] and target = 5::  [[-2, 1, 6]]
 4. list: [-4, -1, -1, 0, 1, 2] and target = 0::  [[-1, -1, 2], [-1, 0, 1]]

 */

func findThreeSumFor(list: [Int], target: Int) -> [[Int]] {
    
    var list = QuickSortPackage().mergeSort(list)
    print("given list: \(list) and target = \(target)", separator: "", terminator: ":: ")
    var resList = [[Int]]()

    for (index, value) in list.enumerated() {
        var left = index + 1
        var right = list.count - 1
        
        if index - 1 > 0 {
            if list[index] == list[index - 1] {
                continue
            }
        }
        
        while (right > left) {
            var sum = value + list[left] + list[right]
            if sum == target {
                resList.append([value, list[left], list[right]])
            }
            
            if sum < target {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return resList
}

print("", findThreeSumFor(list: [1, 2, 4, 0, 9, -2], target: 7))
print("", findThreeSumFor(list: [1, 2, -4, 6, -9, 12], target: 20))
print("", findThreeSumFor(list: [1, -2, -4, 6, 9, -12], target: 5))
print("", findThreeSumFor(list: [-1, 0, 1, 2, -1, -4], target: 0))

import Foundation

/*
 Problem Statement: Given an integer array nums and an integer val, remove all occurrences of val in nums in-place. The relative order of the elements may be changed.
 
 For Eg.
 1. nums = [1, 2, 2, 3, 4, 4, 5, 5, 6, 2], val = 2
    result = [1, 3, 4, 4, 5, 5, 6]
 
 2. nums = [1, 5, 5, 6, 2], val = 5
    result = [1, 6, 2]
 */

func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
    var index = 0
    while index < nums.count {
        if nums[index] == val {
            nums.remove(at: index)
        } else {
            index += 1
        }
    }
    return nums.count
}

var list = [1, 5, 5, 6, 2]
var valueToRemove = 5
print("original list: \(list) with \(valueToRemove) has \(list.count) elements")
print("new list: \(list) without: \(valueToRemove) has \(removeElement(&list, 5)) elements")

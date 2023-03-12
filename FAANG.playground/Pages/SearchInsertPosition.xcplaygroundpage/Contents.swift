import Foundation

/*
Problem Statement: Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
 
 You must write an algorithm with O(log n) runtime complexity.

 For eg:
 
 1. nums = [1, 2, 3, 4, 5, 6], target = 0
 result = 0
 
 2. nums = [1, 2, 3, 4, 5, 6], target = -1
 result = 0
 
 3. nums = [1, 2, 3, 4, 5, 6], target = 6
 result = 5
 
 4. nums = [1, 2, 3, 4, 5, 6], target = 20
 result = 6
 */


func findInsertLocation(_ nums: [Int], _ target: Int, low: Int, high: Int) -> Int {
    
    // Breaking Condition
    if high - low <= 1 {
        if target > nums[low] {
            return high
        } else {
            return low
        }
    }
    
    let mid = (high + low)/2
    var value = -1
    
    if target == nums[mid] {
        value = mid
    } else if target < nums[mid] {
        value = findInsertLocation(nums, target, low: low, high: mid)
    } else {
        value = findInsertLocation(nums, target, low: mid, high: high)
    }
        
    return value
}

let loc = findInsertLocation([1, 2, 3, 4, 5, 6], 20, low: 0, high: 6)
print("location = \(loc)")

import Foundation

/*
 Problem Statement: You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
 
 Increment the large integer by one and return the resulting array of digits.
 
 For Eg.
 
 1. list = [4,3,2,1], output: [4,3,2,2]
 2. list = [4,3,2,2], output: [4,3,2,3]
 3. list = [4,3,2,8], output: [4,3,2,9]
 4. list = [4,3,2,9], output: [4,3,3,0]
 5. list = [4,9,9,9], output: [5,0,0,0]
 */

//func plusOne(_ digits: [Int]) -> [Int] {

func plusOne(_ digits: [Int]) -> [Int] {
    var digits = digits
    print("before list:", digits)
    var index = digits.count - 1, sum = 0
    
    while index >= 0 {
        sum = digits[index] + 1
        if sum > 9 {
            digits[index] = 0
        } else {
            digits[index] = sum
            break
        }
        index -= 1
    }
    
    if sum > 9 {
        digits.insert(1, at: 0)
    }
    print("after list:", digits)
    return digits
}

var digits = [Int]()
plusOne(digits)

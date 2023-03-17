import Foundation

/*
Problem Statement: Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
 
 For Eg.
 
 1. Input: x = 4
    Output: 2
 2. Input: x = 8
    Output: 2
    Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 
 */

func mySqrt(_ x: Int) -> Int {
    if x <= 0 {return x}
    var index = 1
    while index < x/2 {
        if x == index * index {
            return index
        }
        index += 1
        if index * index > x {
         return index - 1
        }
    }
    return index
}

print("square root of 9: \(mySqrt(9))")
print("square root of 4: \(mySqrt(4))")
print("square root of 6: \(mySqrt(6))")
print("square root of 8: \(mySqrt(8))")
print("square root of 1: \(mySqrt(1))")
print("square root of 16: \(mySqrt(16))")
print("square root of 17: \(mySqrt(17))")
print("square root of 25: \(mySqrt(25))")


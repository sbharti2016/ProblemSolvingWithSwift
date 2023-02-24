import Foundation

/*
 Given an array of n non-negative integers height [n], where each value represents a point at coordinate (i, height[i]). Now n vertical lines are drawn such that the two endpoints of line i are at (i, 0) and (i, height[i]). Here each pair of a line with the x-axis forms a container.

 Write a program to find two lines, such that the container contains the most water. We should return an integer that corresponds to the maximum area of water that can be contained.
 
 Idea: Coding problem solved using the two-pointers approach, where both pointers are moving in the opposite direction. The idea and proof behind the efficient solution are intuitive and worth exploring.
 
 Formula to calculate area of a rectangle = width * height
 Formula to calculate area of a square(because all sides are equal) = side * side
 
 */

func findMaxArea(list: [Int]) -> Int {
    var left = 0
    var right = list.count - 1
    var maxArea = 0
    
    while left < right {
        let currentArea = (right - left) * min(list[left], list[right])
        
        if list[left] > list[right] {
            right -= 1
        } else {
            left += 1
        }
        
        if maxArea < currentArea {
            maxArea = currentArea
        }
    }
    return maxArea
}

print("Find area: \(findMaxArea(list: [1, 8, 6, 2, 5, 4, 8, 3, 7]))")
print("Find area: \(findMaxArea(list: [1, 5, 6, 3, 4, 2]))")

import Foundation

/*
 Problem Statement: You are climbing a staircase. It takes n steps to reach the top.
 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?
 
 For eg.
 
 1.  Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 
 2.  Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step
 
 3.  Input: n = 4
 Output: 5
 Explanation: There are five ways to climb to the top.
 1. 1 step + 1 step + 1 step + 1 step
 2. 1 step + 1 step + 2 steps
 3. 1 step + 2 steps + 1 steps
 4. 2 steps + 1 step + 1 steps
 5. 2 steps + 2 steps
 */

func climbStairs(_ n: Int) -> Int {
    if n < 2 {return n}
    var one = 1, two = 1
    for _ in 0 ..< n-1 {
        let temp = one
        one += two
        two = temp
    }
    return one
}

print("Stair(s) = 0 = \(climbStairs(0))")
print("Stair(s) = 1 = \(climbStairs(1))")
print("Stair(s) = 2 = \(climbStairs(2))")
print("Stair(s) = 3 = \(climbStairs(3))")
print("Stair(s) = 4 = \(climbStairs(4))")
print("Stair(s) = 5 = \(climbStairs(5))")
print("Stair(s) = 6 = \(climbStairs(6))")

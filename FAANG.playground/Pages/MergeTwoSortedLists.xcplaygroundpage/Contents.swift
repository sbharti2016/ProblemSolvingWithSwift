import Foundation

/*
 Problem Statement: Merge two sorted linked lists and return it as a new sorted list. New list should be made by splicing together the nodes of the first two lists.
 
For eg.  [1, 90, 100] & [2, 3, 101] will result to [1, 2, 3, 90, 100, 101]
 */


func merge(list1: [Int], list2: [Int]) -> [Int] {
    var result = [Int]()
    
    var i = 0, j = 0
    
    while list1.count > i, list2.count > j {
        if list1[i] > list2[j] {
            result.append(list2[j])
            j += 1
        } else {
            result.append(list1[i])
            i += 1
        }
    }
    
    while list1.count > i {
        result.append(list1[i])
        i += 1
    }
    
    while list2.count > j {
        result.append(list2[j])
        j += 1
    }
    
    return result
}

print("mergeing [1, 90, 100] & [2, 3, 101] = ", merge(list1: [1, 90, 100], list2: [2, 3, 101]))


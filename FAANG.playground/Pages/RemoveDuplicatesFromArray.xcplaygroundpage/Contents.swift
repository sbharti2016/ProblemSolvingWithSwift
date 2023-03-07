import Foundation

/*
 
 Problem Statement: Remove duplicates from a given integer list.
 
 For eg. [1, 2, 2, 3, 4, 4, 5, 5, 5] should return [1, 2, 3, 4, 5]
 */


var list = [1, 2, 2, 3, 4, 4, 5, 5, 5]

func removeDuplicatesFrom(list: inout [Int]) {
    print("given list: \(list)")
    var index = 0
    while index < list.count - 1 {
        if list[index] == list[index + 1] {
            list.remove(at: index + 1)
        } else {
            index += 1
        }
    }
    print("without duplicates: \(list)")
}

removeDuplicatesFrom(list: &list)




import LinkedList
import Stack

/*
 Problem Statement: Merge two sorted lists and return it as a new sorted list. New list should be made by splicing together the nodes of the first two lists.
 
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

//print("mergeing [1, 90, 100] & [2, 3, 101] = ", merge(list1: [1, 90, 100], list2: [2, 3, 101]))


/*  VIA linked list way

 Problem Statement: Merge two sorted linked lists and return it as a new sorted list. New list should be made by splicing together the nodes of the first two lists.
 
For eg.  [1, 90, 100] & [2, 3, 101] will result to [1, 2, 3, 90, 100, 101]
 */

var linklist1 = LinkedList()
linklist1.insert(data: 1)
linklist1.insert(data: 90)
linklist1.insert(data: 100)

var linklist2 = LinkedList()
linklist2.insert(data: 2)
linklist2.insert(data: 3)
linklist2.insert(data: 101)

func mergeLinked(list1Ptr: Node?, list2Ptr: Node?) -> Stack {
    var list1Ptr = list1Ptr, list2Ptr = list2Ptr
    var stack = Stack()
    
    while (list1Ptr != nil && list2Ptr != nil) {
        
        if let list1Data = list1Ptr?.data, let list2Data = list2Ptr?.data, list1Data > list2Data {
            stack.push(data: list2Data)
            list2Ptr = list2Ptr?.next
        } else {
            stack.push(data: list1Ptr?.data ?? -1)
            list1Ptr = list1Ptr?.next
        }
    }
    
    while(list1Ptr != nil) {
        stack.push(data: list1Ptr?.data ?? -1)
        list1Ptr = list1Ptr?.next
    }
    
    while(list2Ptr != nil) {
        stack.push(data: list2Ptr?.data ?? -1)
        list2Ptr = list2Ptr?.next
    }
    
    return stack
}


let mergedList = mergeLinked(list1Ptr: linklist1.first(), list2Ptr: linklist2.first())
print("merged list: \(mergedList.values)")


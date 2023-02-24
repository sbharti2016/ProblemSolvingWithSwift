import Foundation

/*

 Find indexes which resulted in the sum of a given number for eg
 
 eg1. list = [1, 4, 7, 9], givenNumber = 10, result = [0, 3]
 eg1. list = [1, 4, 7, 9], givenNumber = 8, result = [0, 2]
 eg1. list = [1, 4, 7, 9, 11, 0, 14], givenNumber = 16, result = [2, 3]

*/

func findIndexsIn(givenList: [Int], sum: Int) -> [Int] {
    
    var resultedList = [Int]()
    
    
    for (outerIndex, currentElement) in givenList.enumerated() {
        let numberToFind = sum - currentElement
        
        for innerIndex in outerIndex ..< givenList.count {
            if numberToFind == givenList[innerIndex] {
                resultedList.append(outerIndex)
                resultedList.append(innerIndex)
                break
            }
        }
        
        if resultedList.count > 0 {
            break
        }
    }
            
    return resultedList
}

print("indexes: ", findIndexsIn(givenList: [1, 4, 7, 9], sum: 10))
print("indexes: ", findIndexsIn(givenList: [1, 4, 7, 9], sum: 8))
print("indexes: ", findIndexsIn(givenList: [1, 4, 7, 9, 11, 0, 14], sum: 16))

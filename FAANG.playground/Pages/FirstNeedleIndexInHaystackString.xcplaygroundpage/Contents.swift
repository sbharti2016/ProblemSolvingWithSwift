import Foundation

/*
 Problem Statement: Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
for eg:
 1. haystack = "SantaishappysoBantaishappyToo", needle = "happy"
 result = 7

 2. haystack = "TomandJerryAreFriendsbuttheyfightalot", needle = "nofight"
 result = -1, because nofight is not is haystack string
 
 Note: Please uncomment print statements to see things in action.
 */

extension String {
    
    func substring(fromIndex: Int, toIndex: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: fromIndex)
        let endIndex = self.index(startIndex, offsetBy: toIndex)
        
        return String(self[startIndex ... endIndex])
    }
}

func find(_ haystack: String, _ needle: String) -> Int {

    var index = 0
    if haystack.isEmpty || needle.isEmpty {
        return -1
    } else {
        while index <= haystack.count - needle.count {
//            print("index: \(index), needle: \(needle), current haystack: \(haystack.substring(fromIndex: index, toIndex: needle.count - 1))")
            if haystack.substring(fromIndex: index, toIndex: needle.count - 1).elementsEqual(needle) == true {
                return index
            }
            index += 1
        }
    }
    return -1
}

print(find("TomandJerryAreFriendsbuttheyfightalot", "nofight"))
    




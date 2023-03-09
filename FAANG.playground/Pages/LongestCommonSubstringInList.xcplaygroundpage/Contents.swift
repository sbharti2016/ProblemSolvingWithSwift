import Foundation

/*
 Problem Statement: Write a function to find the longest common prefix string amongst an array of strings.
 */

extension String {
    
    func substringTo(_ index: Int) -> String {
        if index > self.count {return ""}
            
        let initialIndex = self.index(self.startIndex, offsetBy: 0)
        let finalIndex = self.index(initialIndex, offsetBy: index)
        return String(self[initialIndex ..< finalIndex])
    }
}

func longestCommonSubstring() -> String {
    var strs = ["sanjeev", "sami", "samy"]
    var index = 1
    let firstElement = strs.first ?? ""

    while true {
        if firstElement.substringTo(index).count > 0 {
            if strs.filter({
                $0.substringTo(index) == firstElement.substringTo(index)
            }).count != strs.count {
                return firstElement.substringTo(index - 1)
            }
            index = index + 1
            print("current index = \(index)")
        } else {
            break
        }
    }
    return firstElement.substringTo(index - 1)
}

print(longestCommonSubstring())

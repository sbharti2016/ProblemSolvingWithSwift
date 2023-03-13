import Foundation

/*
 Given a string s consisting of words and spaces, return the length of the last word in the string.
 
 A word is a maximal substring consisting of non-space characters only.
 
 For Eg.
 
 1. str = "This is me"
 Length of last word = 2 (me)
 
 2. str = "This is me     cool     "
 Length of last word = 4 (cool)
 
 3. str = "  This  is   me  Sanjeev Rokx "
 Length of last word = 4 (Rokx)
 */

func findLengthOfLast(word: String) -> Int {
    var startIndex = -1, endIndex = -1, index = word.count-1
    
    while index >= 0 {
        let symbol = word.stringAt(index)
        if symbol == " ", endIndex > 0 {
            startIndex = index + 1
            break
        } else if symbol != " ", endIndex <= 0 {
            endIndex = index
            index -= 1
        } else {
            index -= 1
        }
    }
    
    startIndex = startIndex <= 0 ? 0 : startIndex
    endIndex = endIndex <= 0 ? 0 : endIndex
    print("startIndex: \(startIndex), endIndex: \(endIndex)")
    print("word: ", word.string(fromIndex: startIndex, toIndex: endIndex - startIndex))
    return word.string(fromIndex: startIndex, toIndex: endIndex - startIndex).count
}

print("length of ` `: ", findLengthOfLast(word: "a "))
print("length of `a`: ", findLengthOfLast(word: "a"))
print("length of ` a`: ", findLengthOfLast(word: " a"))
print("length of `me`: ", findLengthOfLast(word: "me"))
print("length: `This is me`", findLengthOfLast(word: "This is me"))
print("length: `This is me     cool`", findLengthOfLast(word: "This is me     cool"))
print("length: `  This  is   me  Sanjeev Rokx `", findLengthOfLast(word: "  This  is   me  Sanjeev Rokx "))

extension String {
    
    func stringAt(_ index: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: index)
        let endIndex = self.index(startIndex, offsetBy: 0)
        return String(self[startIndex ... endIndex])
    }
    
    func string(fromIndex: Int, toIndex: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: fromIndex)
        let endIndex = self.index(startIndex, offsetBy: toIndex)
        return String(self[startIndex ... endIndex])
    }
}

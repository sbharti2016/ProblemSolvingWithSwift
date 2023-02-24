import Foundation

/*
 Find the longest Palindrome substring in a string for eg.
 
 1. "cbababx" = "babab"
 2. "aaa" = "aaa"
 3. "abb" = "bb"

 My thought process:
 1. check if substring string palindrome.
 2. Start with two pointers from left and right because this way we can get the max length string.
 */

extension String {
    
    func substringAt(_ index: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: index)
        let endIndex = self.index(startIndex, offsetBy: 0)
        return String(self[startIndex ... endIndex])
    }
    
    func subString(fromIndex: Int, toIndex: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: fromIndex)
        let endIndex = self.index(startIndex, offsetBy: toIndex)
        return String(self[startIndex ..< endIndex])
    }
    
}

///  Method to check if given string is palindrome or not
/// - Parameter givenString: string to check for palindrome
/// - Returns: true if palindrome else false
func isPalindrome(_ givenString: String) -> Bool {
    
    var left = 0
    var right = givenString.count - 1
    
    while left < right {
        if "\(givenString.substringAt(left))".elementsEqual("\(givenString.substringAt(right))") == false {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

/// Methods finds longest palindrome in a given string
/// - Parameter givenString: given string to check for palindrome in it
/// - Returns: returns a palindrome string if any else empty
func longestPalindromeIn(_ givenString: String) -> String {

    // If given string length is one it is a Palindrome String.
    if givenString.count == 1 {
        return givenString
    }
    
    var palindromeString = ""
        
    for index in 0 ..< givenString.count {
        var givenStringLength = givenString.count - 1
        while(givenStringLength > index) {
            // If two substrings are matched fetch that substring and send it for palindrome check
            if givenString.substringAt(index).elementsEqual(givenString.substringAt(givenStringLength)) {
                let currentSubstring = givenString.subString(fromIndex: index, toIndex: givenStringLength)
                if isPalindrome(currentSubstring) {
                    palindromeString = currentSubstring
                    break
                }
            }
            givenStringLength -= 1
        }
        
        // this value will only be filled if there is palindrome string.
        if palindromeString.count > 0 {
            break
        }
    }
    
    return palindromeString
}

print("longest palindrome string in cbababx ", longestPalindromeIn("cbababx"))
print("longest palindrome string in aaa ", longestPalindromeIn("aaa"))
print("longest palindrome string in abb ", longestPalindromeIn("abb"))
print("longest palindrome string in abb ", longestPalindromeIn("a"))





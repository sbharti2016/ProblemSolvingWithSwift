import Foundation

/* Find the longest unique substring in a `String`

 For example:
 1. "abcyxyzabac" should give you "abcyx"
 
 2. "lkjasdfjkljasdfkljjhjkhdfglkjkjhkjhjkhjkhjgjhgjhfghiouoiuioweruoweur,mnnkjikjhasudyqwembkjhsadfkahsbjkdfashdfkahsdkjfbaskdgfjgkjsadiowyroiyeiurydsfaksdhflkahsfasdhjfakshdf lasdfkladhsfklhasdklfhpi3yriyso;;"
  = "kjhasudyqwemb"
 
 3. "ab1234cy23xy345zab345345345a2346799654532432234234c" = "ab1234cy"
 
 4. "aaaaaaa" = "a"
 */

func printLongestSubstringIn(_ givenString: String) -> String {
     
    var currentString = ""
    var pastString = ""

    for currentChar in givenString {
        var currentSubString = "\(currentChar)"
        if currentString.localizedStandardContains(currentSubString) {
            if currentString.count > pastString.count {
                pastString = currentString
            }
            currentString = ""
        }
        currentString.append(currentSubString)
    }
    
    return pastString
}

print(printLongestSubstringIn("abcyxyzabac"))

print(printLongestSubstringIn("lkjasdfjkljasdfkljjhjkhdfglkjkjhkjhjkhjkhjgjhgjhfghiouoiuioweruoweur,mnnkjikjhasudyqwembkjhsadfkahsbjkdfashdfkahsdkjfbaskdgfjgkjsadiowyroiyeiurydsfaksdhflkahsfasdhjfakshdf lasdfkladhsfklhasdklfhpi3yriyso;;"))

print(printLongestSubstringIn("ab1234cy23xy345zab345345345a2346799654532432234234c"))

print(printLongestSubstringIn("aaaaa"))











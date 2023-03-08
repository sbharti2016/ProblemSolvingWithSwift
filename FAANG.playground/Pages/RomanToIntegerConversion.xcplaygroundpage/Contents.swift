import Foundation
/*
 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.

 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, 2 is written as II in Roman numeral, just two ones added together. 12 is written as XII, which is simply X + II. The number 27 is written as XXVII, which is XX + V + II.

 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer.
 
 For example:
 
 1. Roman String "IIII" will return 4
    1 + 1 + 1 + 1 = 4
 
 2. Roman String "VX" will return 15
    5 + 10 = 15
 
 3. Roman String "IVX" will return 14
    4 + 10 = 14
 
 4. Roman String "XIVX" will return 24
    10 + 4 + 10 = 24
 
 5. Roman String "MCM" will return 1900
    1000 + 900 = 1900
 
 */

// String Extension
extension String {
    
    // Provide the symbol value in Int
    var value: Int {
        switch self {
        case "I": return 1
        case "V": return 5
        case "X": return 10
        case "L": return 50
        case "C": return 100
        case "D": return 500
        case "M": return 1000
        default: return 0
        }
    }
    
    /// Give substring from a string  at given index
    /// - Parameter index: value at index
    /// - Returns: substring at given index
    func valueAt(index: Int) -> String {
        var firstIndex = self.index(self.startIndex, offsetBy: index)
        var endIndex = self.index(firstIndex, offsetBy: 1)
        return String(self[firstIndex ..< endIndex])
    }
}


/// Method scans for current and next value relation
/// - Parameters:
///   - currentSymbol: currently evaluating roman number
///   - nextSymbol: next roman number
/// - Returns: provide relations info
private func isAffecting(currentSymbol: String, nextSymbol: String) -> Bool {
    var isAffecting = false
    if currentSymbol == "I", "VX".localizedStandardContains(nextSymbol) {
        isAffecting = true
    } else if currentSymbol == "X", "LC".localizedStandardContains(nextSymbol) {
        isAffecting = true
    } else if currentSymbol == "C", "DM".localizedStandardContains(nextSymbol) {
        isAffecting = true
    }
    
    return isAffecting
}

/// Converts given roman string to Int equivalent
/// - Parameter romanString: given roman string to convert to Int
/// - Returns: Int equivalent of the Roman number
func inegerConversionOf(_ romanString: String) -> Int {
    
    var result = 0
    var index = 0
    
    while index < romanString.count {
        
        let currentSymbol = romanString.valueAt(index: index)
        
        // means last element of the string
        if index + 1 <= romanString.count - 1 {
            let nextSymbol = romanString.valueAt(index: index + 1)
            if isAffecting(currentSymbol: currentSymbol, nextSymbol: nextSymbol) {
                result += nextSymbol.value - currentSymbol.value
                index += 2
            } else {
                result += currentSymbol.value
                index += 1
            }
            
        } else {
            //Note: Last value. Directly append the symbol value to result
            result += currentSymbol.value
            index += 1
        }
    }
    
    return result
}

let romanValue = "MCM"
print("Roman conversion of \(romanValue) = \(inegerConversionOf(romanValue))")



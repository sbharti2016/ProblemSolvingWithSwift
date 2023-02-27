import Foundation

public func checkForBalancedParenthesesIn(_ string: String) -> Bool {
    var list = [String]()
    for char in string {
        var symbol = "\(char)"
        if "([{".localizedStandardContains(symbol) {
            list.append(symbol)
        } else {
            var count = list.count - 1
            while count >= 0 {
                if list[count].elementsEqual(opposite(symbol)) {
                    list.remove(at: count)
                    break
                }
                count -= 1
            }
        }
    }
    return list.isEmpty
}

private func opposite(_ symbol: String) -> String {
    switch symbol {
    case ")": return "("
    case "]": return "["
    case "}": return "{"
    default: return ""
    }
}

print("[()] \(checkForBalancedParenthesesIn("[()]") ? "is" : "is not") balanced" )
print("()[]{} \(checkForBalancedParenthesesIn("()[]{}") ? "is" : "is not") balanced" )
print("(} \(checkForBalancedParenthesesIn("(}") ? "is" : "is not") balanced" )

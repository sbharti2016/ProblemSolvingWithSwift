import Foundation

class Stack {
    private var list = [String]()
    func push(data: String) {
        list.append(data)
    }
    
    func pop() -> String? {
        if isEmpty {return nil}
        return list.removeLast()
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
}

private func openingOf(_ symbol: String) -> String {
    switch symbol {
    case ")": return "("
    case "]": return "["
    case "}": return "{"
    default: return ""
    }
}

public func checkForBalancedParenthesesIn(_ string: String) -> Bool {
    let stack = Stack()
    for char in string {
        let symbol = "\(char)"
        if "([{".localizedStandardContains(symbol) {
            stack.push(data: symbol)
        } else {
            let top = stack.pop() ?? ""
            if top.elementsEqual(openingOf(symbol)) == false {
                return false
            }
        }
    }
    return stack.isEmpty
}

print("[()] \(checkForBalancedParenthesesIn("[()]") ? "is" : "is not") balanced")
print("()[]{} \(checkForBalancedParenthesesIn("()[]{}") ? "is" : "is not") balanced")
print("(} \(checkForBalancedParenthesesIn("(}") ? "is" : "is not") balanced")
print("({[]}) \(checkForBalancedParenthesesIn("({[]})") ? "is" : "is not") balanced")


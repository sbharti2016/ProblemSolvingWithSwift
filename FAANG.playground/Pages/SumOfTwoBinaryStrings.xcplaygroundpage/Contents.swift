import Foundation

extension String {

    func subStringAt(_ index: Int) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: index)
        let endIndex = self.index(startIndex, offsetBy: 0)
        return String(self[startIndex ... endIndex])
    }
}


func appendZerosIfUnequalString(a: inout String, b: inout String) {
    if a.count == b.count { return }
    else if a.count > b.count {
        var zeros = String(repeating: "0", count: a.count - b.count)
        b = zeros + b
    } else {
        var zeros = String(repeating: "0", count: b.count - a.count)
        a = zeros + a
    }
}

func addBinary(_ number1: String, _ number2: String) -> String {

    var a = number1, b = number2
    appendZerosIfUnequalString(a: &a, b: &b)
    var result = "", index = a.count-1, carryover = false
    
    while index >= 0 {
        if a.subStringAt(index).elementsEqual("1"), b.subStringAt(index).elementsEqual("1") {
            result = "\(carryover ? "1" : "0")\(result)"
            carryover = true
        } else if a.subStringAt(index).elementsEqual("1") || b.subStringAt(index).elementsEqual("1") {
            result = "\(carryover ? "0" : "1")\(result)"
        } else {
            result = "\(carryover ? "1" : "0")\(result)"
            carryover = false
        }
        index -= 1
    }
    
    if carryover {
        result = "1" + result
    }
    
    return result
}

print(addBinary("", "1"))


import LinkedList

public class Stack: LinkedList {
    
    private var linkedList = LinkedList()
    
    public func push(data: Int) {
        linkedList.insert(data: data)
    }
    
    public func pop() -> Node? {
        guard let poppedElement = linkedList.last() else {return nil}
        _ = linkedList.delete(data: poppedElement.data)
        return poppedElement
    }
    
    var isEmpty: Bool {
        return linkedList.nodes().count == 0
    }
}

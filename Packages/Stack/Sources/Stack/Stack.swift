import LinkedList

protocol StackProtocol {
    func push(data: Int)
    func pop() -> Node?
    var values: [Int] {get}
    var isEmpty: Bool {get}
}

public class Stack: StackProtocol {
    
    private var linkedList = LinkedList()
    
    public init() {}
    
    public func push(data: Int) {
        linkedList.insert(data: data)
    }
    
    public func pop() -> Node? {
        guard let poppedElement = linkedList.last() else {return nil}
        _ = linkedList.delete(data: poppedElement.data)
        return poppedElement
    }
    
    public var values: [Int] {
        return linkedList.nodes()
    }
    
    public var isEmpty: Bool {
        return linkedList.nodes().count == 0
    }
    
    public var first: Node? {
        return linkedList.first()
    }
    
}

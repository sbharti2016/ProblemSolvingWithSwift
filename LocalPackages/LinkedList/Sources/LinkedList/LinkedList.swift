/*
 One way linked list
*/


public class Node {
    var data: Int
    var next: Node?
    
    init(data: Int) {
        self.data = data
    }
}

public protocol LinkedListProtocols {
    func insert(data: Int)
    func nodes() -> [Int]
    func Search(_ data: Int) -> Bool
    func insert(data: Int, beforeData: Int)
    func insert(data: Int, afterData: Int)
    func replace(data: Int, withData: Int)
    func delete(data: Int) -> Int?
    func last() -> Node?
    func first() -> Node?
    func reverse() -> [Int]
}

public class LinkedList: LinkedListProtocols {
    
    private var root: Node?
    
    public func insert(data: Int) {
        var rootCopy = root
        root = insert(data: data, root: &rootCopy)
    }
    
    public func Search(_ data: Int) -> Bool {
        var found = false
        if root == nil {
            found = false
        } else {
            var rootCopy = root
            while rootCopy?.data != data, rootCopy != nil {
                rootCopy = rootCopy?.next
            }
            found = rootCopy?.data == data
        }
        return found
    }
    
    public func delete(data: Int) -> Int? {
        var deletedData: Int?
        
        if root == nil {
            return nil
        } else if root?.data == data {
            deletedData = root?.data
            root = root?.next
        } else {
            var copyCopy = root
            while copyCopy?.next?.data != data, copyCopy != nil {
                copyCopy = copyCopy?.next
            }
            deletedData = copyCopy?.next?.data
            copyCopy?.next = copyCopy?.next?.next
        }
        
        return deletedData
    }
    
    public func nodes() -> [Int] {
        var rootCopy = root
        var list = [Int]()
        while rootCopy != nil {
            list.append(rootCopy?.data ?? -1)
            rootCopy = rootCopy?.next
        }
        return list
    }
    
    public func insert(data: Int, beforeData: Int) {
        
        guard Search(beforeData) else {
            return
        }
        
        let newNode = Node(data: data)
        
        if root == nil {
            root = newNode
        } else if root?.data == beforeData {
            newNode.next = root
            root = newNode
        } else {
            var rootCopy = root
            while rootCopy?.next?.data != beforeData, rootCopy != nil {
                rootCopy = rootCopy?.next
            }
            
            newNode.next = rootCopy?.next
            rootCopy?.next = newNode
        }
        
    }
    
    public func insert(data: Int, afterData: Int) {
        guard Search(afterData) else {return}
        
        if root == nil {
            root = Node(data: data)
        } else {
            var rootCopy = root
            while rootCopy?.data != afterData, rootCopy != nil {
                rootCopy = rootCopy?.next
            }
            
            let newNode = Node(data: data)
            newNode.next = rootCopy?.next
            rootCopy?.next = newNode
        }
    }
    
    public func replace(data: Int, withData: Int) {
        guard Search(data) else {return}
        var rootCopy = root
        while rootCopy?.data != data, root != nil {
            rootCopy = rootCopy?.next
        }
        rootCopy?.data = withData
    }
    
    public func last() -> Node? {
        var rootCopy = root
        while rootCopy?.next != nil, rootCopy != nil {
            rootCopy = rootCopy?.next
        }
        return rootCopy
    }
    
    public func first() -> Node? {
        return root
    }
    
    public func reverse() -> [Int] {
        var revList = [Int]()
        while let node = last() {
            revList.append(node.data)
            _ = delete(data: node.data)
        }
        return revList
    }
}

extension LinkedList {
    
    private func insert(data: Int, root: inout Node?) -> Node? {
        if root == nil {
            root = Node(data: data)
        } else {
            root?.next = insert(data: data, root: &root!.next)
        }
        return root
    }
    
}

public struct MergeSort {

    private var list: [Int]
    public init(list: [Int]) {
        self.list = list
    }
    
    public var sorted: [Int] {
        return mergeSortOn(list)
    }
    
    private func mergeSortOn(_ list: [Int]) -> [Int] {
        
        if list.count <= 1 {
            return list
        }
        let length = list.count/2
        let leftList = mergeSortOn(Array(list[0..<length]))
        let rightList = mergeSortOn(Array(list[length..<list.count]))

        return merge(list1: leftList, list2: rightList)
    }
    
    private func merge(list1: [Int], list2: [Int]) -> [Int] {
        var result = [Int]()
        
        var i = 0, j = 0
        
        while list1.count > i, list2.count > j {
            if list1[i] > list2[j] {
                result.append(list2[j])
                j += 1
            } else {
                result.append(list1[i])
                i += 1
            }
        }
        
        while list1.count > i {
            result.append(list1[i])
            i += 1
        }
        
        while list2.count > j {
            result.append(list2[j])
            j += 1
        }
        
        return result
    }
    
}

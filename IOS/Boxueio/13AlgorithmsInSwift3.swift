func insertionSortOf<T: Comparable>(
        _ coll: Array<T>,
        byCriteria: CRITERIA<T> = { $0 < $1 }) -> Array<T> {
    
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    
    for x in 1 ..< coll.count {
        var y = x
        let key = result[y]
        
        print("Get: \(key)")
        
        // 2. If the key needs to swap in the previous ordered sub array
        while y > 0 && byCriteria(key, result[y - 1]) {
            print("-----------------------------")
            print("Remove: \(result[y]) at pos: \(y)")
            print("Insert: \(key) at pos: \(y - 1)")
            print("-----------------------------")
            
            // 3. Swap the value
            // Notice the new Swift 3 API: remove(at:) replaces removeAtIndex
            // You can also use swap(:) instead of remove and insert
            result.remove(at: y)
            result.insert(key, at: y - 1)
            
            y -= 1
        }
    }
    
    // 4. Return the sorted array
    return result
}

typealias Criteria<T> = (T, T) -> Bool
func SelectionSortOf<T: Comparable>(_ coll: Array<T>,
                     byCriteria: Criteria<T> = { $0 < $1 }) -> Array<T> {

    guard coll.count > 1 else { return coll }

    var result = coll

    // 1. Increase the sorted sub array
    for x in 0 ..< coll.count - 1 {
        var candidateIndex = x
        print("--------------------------")
        print("Sorted:\t\(result[0 ..< candidateIndex])")
        print("Unsorted:\t\(result[candidateIndex ..< result.count])")

        // 2. Find the next element to be moved into the sorted portion
        for y in x + 1 ..< coll.count {
            if byCriteria(result[y], result[candidateIndex]) {
                candidateIndex = y
            }
        }

        // 3. Swap the candidate into sorted sub array if needed
        print(">>> Move \(result[candidateIndex]) into the sorted portion")
        if (candidateIndex != x) {
            swap(&result[candidateIndex], &result[x])
        }
    }

    return result
}

fileprivate func insert(value: T, under parent: TreeNode<T>) {
   if value < parent.value {
       if let left = parent.left {
           insert(value: value, under: left)
       }
       else {
           let node = TreeNode<T>(value: value)
           parent.left = node
           node.parent = parent
       }
   }
   else if value > parent.value {
       if let right = parent.right {
           insert(value: value, under: right)
       }
       else {
           let node = TreeNode<T>(value: value)
           parent.right = node
           node.parent = parent
       }
   }
}

extension BST: CustomStringConvertible {
    open var description: String {
        return self.printNode(node: self.root, forDebug: false)
    }
}

extension BST: CustomDebugStringConvertible {
    open var debugDescription: String {
        return self.printNode(node: self.root, forDebug: true)
    }
}

fileprivate func preorderTraverse(node: TreeNode<T>?, 
    process: (TreeNode<T>) -> Void) {
    guard let node = node else { return }
   
    process(node)
    preorderTraverse(node: node.left, process: process)
    preorderTraverse(node: node.right, process: process)
}
    
fileprivate func inorderTraverse(node: TreeNode<T>?, 
    process: (TreeNode<T>) -> Void) {
    guard let node = node else { return }
   
    inorderTraverse(node: node.left, process: process)
    process(node)
    inorderTraverse(node: node.right, process: process)
}
    
fileprivate func postorderTraverse(node: TreeNode<T>?, 
    process: (TreeNode<T>) -> Void) {
    guard let node = node else { return }
   
    postorderTraverse(node: node!.left, process: process)
    postorderTraverse(node: node!.right, process: process)
    process(node)
}

open class BST  {
    public init() {
        print("New BST initialized.")
    }
}

extension BST: CustomStringConvertible {
    public var description: String {
        return "BST"
    }
}

class BSTTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(BST().description, "BST")
    }
}


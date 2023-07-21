let numbers: NSMutableArray = [1, 2, 3, 4, 5]

for _ in numbers { // Will CRASH when iterating
    numbers.removeLastObject()
}

var numberIter = numbers.makeIterator()

while let number = numberIter.next() {
    numbers.removeLastObject()
}

let nubmers = [1, 2, 3, 4, 5]

for _ in numbers {
    numbers.removeLast()
}

class Queue {
    var position = 0
    var array: [Int] = []
    
    init(_ array: [Int]) {
        self.array = array
    }
    
    func next() -> Int? {
        guard position < array.count else { 
            return nil 
        }
        
        position += 1
        
        return array[position - 1]
    }
}

func traverseQueue(_ queue: Queue) {
    while let item = queue.next() {
        print(item)
    }
}

let q = Queue([1, 2, 3, 4, 5])
traverseQueue(q)

for _ in 0..<1000 {
    let q = Queue([1, 2, 3, 4, 5])
    
    DispatchQueue.global().async {
        traverseQueue(q) // May crash here
    }

    traverseQueue(q) // Or here
}


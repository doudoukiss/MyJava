protocol IteratorProtocol {
    associatedtype Element
    
    mutating func next() -> Element?
}

protocol Sequence {
    associatedtype Iterator: IteratorProtocol
    
    func makeIterator() -> Iterator
}

struct FiboIterator: IteratorProtocol {
    var state = (0, 1)
    
    mutating func next() -> Int? {
        let nextValue = state.0
        state = (state.1, state.0 + state.1)
        
        return nextValue
    }
}

struct Fibonacci: Sequence {
    
    func makeIterator() -> FiboIterator {
        return FiboIterator()
    }
}

let fib = Fibonacci()
var fibIter = fib.makeIterator()
var i = 1

while let value = fibIter.next(), i != 10 {
    print(value)
    i += 1
}


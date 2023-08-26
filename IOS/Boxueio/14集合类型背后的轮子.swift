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

func fiboIterator() -> AnyIterator<Int> {
    var state = (0, 1)
    
    return AnyIterator {
        let theNext = state.0
        state = (state.1, state.0 + state.1)
        
        return theNext
    }
}

struct FiboIterator: IteratorProtocol {
    var state = (0, 1)

    mutating func next() -> Int? {
        let nextValue = state.0
        state = (state.1, state.0 + state.1)

        return nextValue
    }
}

protocol Queue {
    associatedtype Element
    
    mutating func push(_ element: Element)

    mutating func pop() -> Element?
}

struct FIFOQueue<Element>: Queue {
    fileprivate var operation: [Element] = []
    fileprivate var storage: [Element] = []
    
    mutating func pop() -> Element? {
        if operation.isEmpty {
            operation = storage.reversed()
            storage.removeAll()
        }
        
        return operation.popLast()
    }
}

public protocol Collection : Indexable, Sequence {
    // Associated types
    associatedtype IndexDistance : SignedInteger = Int
    associatedtype Iterator : IteratorProtocol = IndexingIterator<Self>
    associatedtype SubSequence : IndexableBase, Sequence = Slice<Self>
    associatedtype Indices : IndexableBase, Sequence = DefaultIndices<Self>

    // Computed properties
    public var first: Self.Iterator.Element? { get }
    public var indices: Self.Indices { get }

    public var isEmpty: Bool { get }
    public var count: Self.IndexDistance { get }
    
    // Subscription operator
    public subscript(position: Self.Index) -> Self.Iterator.Element { get }
    public subscript(bounds: Range<Self.Index>) -> Self.SubSequence { get }

    // Instance methods
    public func makeIterator() -> Self.Iterator
    
    public func prefix(upTo end: Self.Index) -> Self.SubSequence
    public func prefix(through position: Self.Index) -> Self.SubSequence

    public func suffix(from start: Self.Index) -> Self.SubSequence
    
    public func index(_ i: Self.Index, 
        offsetBy n: Self.IndexDistance) -> Self.Inde
    public func index(_ i: Self.Index, 
        offsetBy n: Self.IndexDistance, 
        limitedBy limit: Self.Index) -> Self.Index?
    
    public func distance(from start: Self.Index, 
        to end: Self.Index) -> Self.IndexDistance
}

extension FIFOQueue: Collection {
    public var startIndex: Int { return 0 }
    
    public var endIndex: Int {
        return operation.count + storage.count
    }
    
    public func index(after i: Int) -> Int {
        precondition(i < endIndex)
        
        return i + 1
    }
    
    public subscript(pos: Int) -> Element {
        precondition((startIndex..<endIndex).contains(pos),
                     "Out of range")
        
        if pos < operation.endIndex {
            return operation[operation.count - 1 - pos]
        }
        
        return storage[pos - operation.count]
    }
}

public struct ListIndex<Element>: CustomStringConvertible {
    fileprivate let node: Node<Element>
    fileprivate let tag: Int
    
    public var description: String {
        return "IndexTag: \(tag)"
    }
}

extension ListIndex: Comparable {
    public static func ==<T> (
        lhs: ListIndex<T>,
        rhs: ListIndex<T>) -> Bool {
        return lhs.tag == rhs.tag
    }
    
    public static func < <T>(
        lhs: ListIndex<T>,
        rhs: ListIndex<T>) -> Bool {
        return lhs.tag > rhs.tag
    }
}

struct List<Element>: Collection {
    typealias Index = ListIndex<Element>
    
    var startIndex: Index
    let endIndex: Index
    subscript(position: Index) -> Element {
        switch position.node {
        case .end:
            fatalError("out of range")
        case let .node(value, _):
            return value
        }
    }
    func index(after idx: Index) -> Index {
        switch idx.node {
        case .end:
            fatalError("out of range")
        case let .node(_, next):
            return Index(node: next, tag: idx.tag - 1)
        }
    }
}

extension List: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        startIndex = Index(node: 
            elements.reversed().reduce(.end) {
                $0.insert($1)
            }, tag: elements.count)

        endIndex = Index(node: .end, tag: 0)
    }
}

extension List {
    mutating func push(_ value: Element) {
        startIndex = Index(
            node: startIndex.node.insert(value),
            tag: startIndex.tag + 1)
    }
    
    mutating func pop() -> Index {
        let ret = startIndex
        startIndex = index(after: startIndex)
        
        return ret
    }
}

extension List: CustomStringConvertible {
    var description: String {
        let values = self.map { 
                String(describing: $0) 
            }.joined(separator: ", ")
        
        return "List: \(values)"
    }
}

extension List: IteratorProtocol, Sequence {
    mutating public func next() -> Element? {
        switch pop().node {
        case .end:
            return nil
        case let .node(value, _):
            return value
        }
    }
}

public struct Slice<Base : _Indexable>
    : Collection {

    public typealias Index = Base.Index
    public typealias IndexDistance = Base.IndexDistance

    public var _startIndex: Index
    public var _endIndex: Index

    internal let _base: Base

    public init(base: Base, bounds: Range<Index>) {
        self._base = base
        self._startIndex = bounds.lowerBound
        self._endIndex = bounds.upperBound
    }

    public var startIndex: Index {
        return _startIndex
    }

    public var endIndex: Index {
        return _endIndex
    }

}
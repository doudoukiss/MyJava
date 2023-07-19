var array1: Array<Int> = Array<Int>()
var array2: [Int] = []
var array3 = array2
var threeInts = [Int](repeating: 3, count: 3)
var sixInts = threeInts + threeInts
var fiveInts = [1, 2, 3, 4, 5]
fiveInts[0...2]
fiveInts[0..<2]
fiveInts.forEach { print($0) }
array1.append(1) 
array1 += [2, 3, 4]
array1.insert(5, at: array1.endIndex)
array1.remove(at: 4)
array1.removeLast()
array2.removeLast()

func getBufferAddress<T>(of array: [T]) -> String {
    return array.withUnsafeBufferPointer { buffer in
        return String(describing: buffer.baseAddress)
    }
}

getBufferAddress(of: a)
getBufferAddress(of: copyA)

a.append(4)

getBufferAddress(of: a)
getBufferAddress(of: copyA)

let b = NSMutableArray(array: [1, 2, 3])
let copyB: NSArray = b
b.insert(0, at: 0)

let deepCopyB = b.copy() as! NSArray

let a = [1, 2, 3]
type(of: a[1])
a.forEach { print($0) }
for (index, value) in a.enumerated() {}
a.first 
a.last  
type(of: a.first) 
a.filter { $0 % 2 == 0 }
a.removelast()
a.poplast()

var fibonacci = [0, 1, 1, 2, 3, 5]
var squares = [Int]()

for value in fibonacci {
    squares.append(value * value)
}

let constSquares = fibonacci.map { $0 * $0 }
extension Array {
    func myMap<T>(_ transform: (Element) -> T) -> [T] {
        var tmp: [T] = []
        tmp.reserveCapacity(count)

        for value in self {
            tmp.append(transform(value))
        }

        return tmp
    }
}
let constSequence1 = fibonacci.myMap { $0 * $0 }
fibonacci.min()
fibonacci.max()
fibonacci.filter { $0 % 2 == 0 }
fibonacci.elementsEqual([0, 1, 1], by: { $0 == $1 })
fibonacci.starts(with: [0, 1, 1], by: { $0 == $1 })
fibonacci.sorted(by: >)
let pivot = fibonacci.partition(by: { $0 < 1 })
fibonacci[0 ..< pivot] 
fibonacci[pivot ..< fibonacci.endIndex]
fibonacci.reduce(0, +)

var sum = 0
let constSquares2 = fibonacci.map { (fib: Int) -> Int in
    sum += fib
    return fib * fib
}

extension Array {
    func accumulate<T>(_ initial: T,
                       _ nextSum: (T, Element) -> T) -> [T] {
        var sum = initial

        return map { next in
            sum = nextSum(sum, next)
            return sum
        }
    }
}
fibonacci.accumulate(0, +)

extension Array {
    func myFilter(_ predicate: (Element) -> Bool) -> [Element] {
        var tmp: [Element] = []
        
        for value in self where predicate(value) {
            tmp.append(value)
        }
        
        return tmp
    }

    func reject(_ predicate: (Element) -> Bool) -> [Element] {
        return filter { !predicate($0) }

    func allMatch(_ predicate: (Element) -> Bool) -> Bool {
        return !contains { !predicate($0) }
    }

    func myReduce<T>(_ initial: T, _ next: (T, Element) -> T) -> T {
        var tmp = initial
        
        for value in self {
            tmp = next(tmp, value)
        }
        
        return tmp
    }

    func myMap2<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([], { $0 + [transform($1)] })
    }

    func myFilter2(_ predicate: (Element) -> Bool) -> [Element] {
        return reduce([], { predicate($1) ? $0 + [$1] : $0 })
    }

    func myFlatMap<T>(_ transform: (Element) -> [T]) -> [T] {
        var tmp: [T] = []
        
        for value in self {
            tmp.append(contentsOf: transform(value))
        }
        
        return tmp
    }  
}
animals.myFlatMap { animal in
    return ids.map { id in (animal, id) }
}


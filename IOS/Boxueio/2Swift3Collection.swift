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

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

enum RecordType {
    case bool(Bool)
    case number(Int)
    case text(String)
}

let record11: [String: RecordType] = [
    "uid": .number(11),
    "exp": .number(100),
    "favourite": .bool(true),
    "title": .text("Dictionary basics")
]

for key in record11.keys { print(key) }
record11.keys.forEach { print($0) }

for (k, v) in record10 {
    print("\(k): \(v)")
}

record10.forEach { print("\($0): \($1)") }

for key in record10.keys.sorted() {
    print("\(key): \(record10[key])")
}

let defaultRecord: [String: RecordType] = [
    "uid": .number(0),
    "exp": .number(100),
    "favourite": .bool(false),
    "title": .text("")
]

var template = defaultRecord
var record11Patch: [String: RecordType] = [
    "uid": .number(11),
    "title": .text("Common dictionary extensions")
]

extension Dictionary {
    mutating func merge<S:Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value: Value) {

        sequence.forEach { self[$0] = $1 }
    }

    init<S:Sequence>(_ sequence: S)
        where S.Iterator.Element == (key: Key, value: Value) {

        self = [:]
        self.merge(sequence)
    }

    func mapValue<T>(_ transform: (Value) -> T) -> [Key: T] {
        return Dictionary<Key, T>(map { (k, v) in
            return (k, transform(v))
        })
    }

}
let record10Patch: [(key: String, value: RecordType)] = [
    (key: "uid",   value: .number(10)),
    (key: "title", value: .text("Common dictionary extensions"))
]

var template1 = defaultRecord
template1.merge(record10Patch)
let record11 = Dictionary(record11Patch)
record11.map { $1 }

let newRecord11 = record11.mapValue { record -> String in
    switch record {
    case .text(let title):
        return title
    case .number(let exp):
        return String(exp)
    case .bool(let favourite):
        return String(favourite)
    }
}

 struct Account {
    var alias: String
    var type: Int
    var createdAt: Date

    let INT_BIT = (Int)(CHAR_BIT) * MemoryLayout<Int>.size

    func bitwiseRotate(value: Int, bits: Int) -> Int {
        return (((value) << bits) | ((value) >> (UINT_BIT - bits)))
    }

}

extension Account: Hashable {
    var hashValue: Int
}
extension Account: Hashable {
    var hashValue: Int {
        return alias.hashValue ^
                type.hashValue ^
                createdAt.hashValue
    }
}
extension Account: Equatable {
    static func == (lhs: Account, rhs: Account) -> Bool {
        return lhs.alias == rhs.alias &&
            lhs.type == rhs.type &&
            lhs.createdAt == rhs.createdAt
    }
}

extension Account: Hashable {
    var hashValue: Int {
        return bitwiseRotate(value: alias.hashValue, bits: 10) ^
            type.hashValue ^
            createdAt.hashValue
    }
}

var vowel: Set<Character> = ["a", "e", "i", "o", "u"]
vowel.count .isEmpty  contains  remove insert removeAll
for character in vowel {
    print(character)
}
vowel.forEach { print($0) }
for character in vowel.sorted() {
    print(character)
}

var setA: Set = [1, 2, 3, 4, 5, 6]
var setB: Set = [4, 5, 6, 7, 8, 9]
let interSectAB: Set = setA.intersection(setB)
let symmetricDiffAB: Set = setA.symmetricDifference(setB)
let unionAB: Set = setA.union(setB)
let aSubstractB: Set = setA.subtracting(setB)
setA.formIntersection(setB)

extension Sequence where Iterator.Element: Hashable {
    func unique() -> [Iterator.Element] {
        var result: Set<Iterator.Element> = []
        
        return filter {
            if result.contains($0) {
                return false
            }
            else {
                result.insert($0)
                return true
            }
        }
    }
}
let oneToSix: IndexSet = [1, 2, 3, 4, 5, 6]
let hw = "Hello world!"

let numbers = CharacterSet(charactersIn: "123456789")
let letters = CharacterSet.letters

hw.rangeOfCharacter(from: numbers) 
hw.rangeOfCharacter(from: letters)

for i in stride(from: 1.0, to: 5.0, by: 1.0) {
    print(i)
}
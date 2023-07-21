func mul(m: Int, n: Int) {
    print(m * n)
}
mul(m: 2, n: 3)
func mul(multiplicand m: Int, of n: Int) {
    print(m * n)
}
mul(multiplicand: 2, of: 3)
func mul(_ m: Int, of n: Int) {
    print(m * n)
}
mul(2, of: 3)
func mul(_ numbers: Int ...) {
    let arrayMul = numbers.reduce(1, *)
    print("mul: \(arrayMul)")
}
func mul(result: Int, _ numbers: Int ...) {
    result = numbers.reduce(1, *) 
    print("mul: \(result)")
}
func mul(_ numbers: Int ...) -> Int {
    return numbers.reduce(1, *)
}

func mul(m: Int, of n: Int) -> Int {
    return m * n
}
func div(a: Int, b: Int) -> Int {
    return a / b
}
func calc<T>(_ first: T,
             _ second: T,
             _ fn: (T, T) -> T) -> T {
    return fn(first, second)
}
calc(2, 3, mul) 
calc(2, 3, div)

func mul(_ a: Int) -> (Int) -> Int {
    func innerMul(_ b: Int) -> Int {
        return a * b
    }

    return innerMul
}

let mul2By = mul(2)
mul2By(3)

mul(2)(3)

func square(n: Int) -> Int {
    return n * n
}
let squareExpression = { (n: Int) -> Int in 
    return n * n
}
let numbers = [1, 2, 3, 4, 5]
numbers.map(square) 
numbers.map(squareExpressions) 
numbers.map({ (n: Int) -> Int in 
    return n * n
})
numbers.map({ n in return n * n })
numbers.map({ n in n * n })
numbers.map({ $0 * $0 })
numbers.map() { $0 * $0 }
numbers.map { $0 * $0 }
numbers.sorted(by: { $0 > $1 })
numbers.sorted(by: >)
(0...9).map { arc4random() }

func makeCounter() -> () -> Int {
    var value = 0

    return {
        value += 1

        return value
    }
}

func makeCounter() -> () -> Int {
    var value = 0
    func increment() -> Int {
        value += 1
        return value
    }

    return increment
}


extension Array where Element: Comparable {
    mutating func mergeSort(_ begin: Index, _ end: Index) {
        if (end - begin) > 1 {
            let mid = (begin + end) / 2

            mergeSort(begin, mid)
            mergeSort(mid, end)

            merge(begin, mid, end)
        }
    }
}

extension Array where Element: Comparable {
    private mutating func merge(_ begin: Index, _ mid: Index, _ end: Index) {
        var tmp: [Element] = []

        var i = begin
        var j = mid

        while i != mid && j != end {
            if self[i] < self[j] {
                tmp.append(self[i])
                i += 1
            }
            else {
                tmp.append(self[j])
                j += 1
            }
        }

        tmp.append(contentsOf: self[i ..< mid])
        tmp.append(contentsOf: self[j ..< end])

        replaceSubrange(begin..<end, with: tmp)
    }
}

var numbers = [1, 2, 6, 9, 8]
numbers.mergeSort(numbers.startIndex, numbers.endIndex)

mutating func mergeSort(_ begin: Index, _ end: Index) {
    var tmp: [Element] = []
    tmp.reserveCapacity(count)

    func merge(_ begin: Int, _ mid: Int, _ end: Int) {
        tmp.removeAll(keepingCapacity: true)

        while i != mid && j != end {
            if self[i] < self[j] {
                tmp.append(self[i])
                i += 1
            }
            else {
                tmp.append(self[j])
                j += 1
            }
        }

        tmp.append(contentsOf: self[i ..< mid])
        tmp.append(contentsOf: self[j ..< end])

        replaceSubrange(begin..<end, with: tmp)
    }

    if ((end - begin) > 1) {
        let mid = (begin + end) / 2

        mergeSort(begin, mid)
        mergeSort(mid, end)

        merge(begin, mid, end)
    }
}

final class Episode: NSObject {
    @objc var title: String
    @objc var type: String
    @objc var length: Int
    
    override var description: String {
        return title + "\t" + type + "\t" + String(length)
    }
    
    init(title: String, type: String, length: Int) {
        self.title = title
        self.type = type
        self.length = length
    }   
}

let episodes = [
    Episode(title: "title 1", type: "Free", length: 520),
    Episode(title: "title 4", type: "Paid", length: 500),
    Episode(title: "title 2", type: "Free", length: 330),
    Episode(title: "title 5", type: "Paid", length: 260),
    Episode(title: "title 3", type: "Free", length: 240),
    Episode(title: "title 6", type: "Paid", length: 390),
]

let typeDescriptor = NSSortDescriptor(
    key: #keyPath(Episode.type),
    ascending: true,
    selector: #selector(NSString.localizedCompare(_:)))

let descriptors = [typeDescriptor]
let sortedEpisodes = (episodes as NSArray).sortedArray(using: descriptors)
sortedEpisodes.forEach { print($0 as! Episode) }

let lengthDescriptor = NSSortDescriptor(
    key: #keyPath(Episode.length),
    ascending: true)

let descriptors = [ typeDescriptor, lengthDescriptor ]
/*
*/

typealias SortDescriptor<T> = (T, T) -> Bool

let stringDescriptor: SortDescriptor<String> = {
    $0.localizedCompare($1) == .orderedAscending
}
let lengthDescriptor: SortDescriptor<Episode> = { 
    $0.length < $1.length 
}
func makeDescriptor<Key, Value>(
    key: @escaping (Key) -> Value,
    _ isAscending: @escaping (Value, Value) -> Bool
) -> SortDescriptor<Key> {

        return { isAscending(key($0), key($1)) }
}

let lengthDescriptor: SortDescriptor<Episode> =
    makeDescriptor(key: { $0.length }, <)

let typeDescriptor: SortDescriptor<Episode> =
    makeDescriptor(key: { $0.type }, {
        $0.localizedCompare($1) == .orderedAscending
    })

episodes.sorted(by: typeDescriptor)
    .forEach { print($0) }

func combine<T>(rules: [SortDescriptor<T>]) -> SortDescriptor<T> {
    return { l, r in
        for rule in rules {
            if rule(l, r) {
                return true
            }
            
            if rule(r, l) {
                return false
            }
        }
        
        return false
    }
}
let mixDescriptor = combine(rules: 
    [typeDescriptor, lengthDescriptor])

episodes.sorted(by: mixDescriptor)
    .forEach { print($0) }

typealias SortDescriptor<T> = (T, T) -> Bool

func makeDescriptor<Key, Value>(
    key: @escaping (Key) -> Value,
    _ isAscending: @escaping (Value, Value) -> Bool
) -> SortDescriptor<Key> {

        return { isAscending(key($0), key($1)) }
}

let lengthDescriptor: SortDescriptor<Episode> =
    makeDescriptor(key: { $0.length }, >)

let typeDescriptor: SortDescriptor<Episode> =
    makeDescriptor(key: { $0.type }, {
        $0.localizedCompare($1) == .orderedAscending
    })

let mixDescriptor = combine(rules: 
    [typeDescriptor, lengthDescriptor])

episodes.sorted(by: mixDescriptor)

let numbers = ["Five", "4", "3", "2", "1"]
let intDescriptor: SortDescriptor<String> =
    makeDescriptor(key: { Int($0) }, <)

let intDescriptor: SortDescriptor<String> =
    makeDescriptor(key: { Int($0) }, { l, r in
        switch (l, r) {
        case (nil, nil):
            return false
        case (nil, _):
            return false
        case (_, nil):
            return true
        case let (l?, r?):
            return l < r
        default:
            fatalError()
        }
    })

func shift<T: Comparable>(
    _ compare: @escaping (T, T) -> Bool) -> (T?, T?) -> Bool {
    return { l, r in
        switch (l, r) {
        case (nil, nil):
            return false
        case (nil, _):
            return false
        case (_, nil):
            return true
        case let (l?, r?):
            return compare(l, r)
        default:
            fatalError()
        }
    }
}

let intDescriptor: SortDescriptor<String> =
    makeDescriptor(key: { Int($0) }, shift(<))

episodes.sorted(by: typeDescriptor |> lengthDescriptor)
infix operator |>: LogicalDisjunctionPrecedence
func |><T>(
    l: @escaping SortDescriptor<T>,
    r: @escaping SortDescriptor<T>) -> SortDescriptor<T> {

    return {
        if l($0, $1) {
            return true
        }

        if l($1, $0) {
            return false
        }

        if r($0, $1) {
            return true
        }

        return false
    }
}
episodes.sorted(by: typeDescriptor |> lengthDescriptor)

protocol FinishAlertViewDelegate: class {
    func buttonPressed(at index: Int)
}

class FinishAlertView {
    var buttons: [String] = [ "Cancel", "The next" ]
    weak var delegate: FinishAlertViewDelegate?
    
    func goToTheNext() {
        delegate?.buttonPressed(at: 1)
    }
}

class EpisodeViewController: FinishAlertViewDelegate {
    var episodeAlert: FinishAlertView!
    
    init() {
        // 1. Init
        self.episodeAlert = FinishAlertView()
        // 2. Register itself
        self.episodeAlert.delegate = self
    }
    
    // 3. Implement interface
    func buttonPressed(at index: Int) {
        print("Go to the next episode...")
    }
}

protocol FinishAlertViewDelegate {
    mutating func buttonPressed(at Index: Int)
}

class FinishAlertView {
    var delegate: FinishAlertViewDelegate?
}

struct PressCounter: FinishAlertViewDelegate {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

class EpisodeViewController {
    var episodeAlert: FinishAlertView!
    var counter: PressCounter!
    
    init() {
        self.episodeAlert = FinishAlertView()
        self.counter = PressCounter()
        self.episodeAlert.delegate = self.counter
    }
}

(evc.episodeAlert.delegate as! PressCounter).count

class FinishAlertView {
    var buttons: [String] = [ "Cancel", "The next" ]
    var buttonPressed: ((Int) -> Void)?
    
    func goToTheNext() {
        buttonPressed?(1)
    }
}

struct PressCounter {
    var count = 0
    
    mutating func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

let fav = FinishAlertView()
var counter = PressCounter()

fav.buttonPressed = counter.buttonPressed
fav.buttonPressed = { counter.buttonPressed(at: $0) }
fav.buttonPressed = { _ in print("OK, go to the next episode") }
class PressCounter {
    var count = 0
    
    func buttonPressed(at Index: Int) {
        self.count += 1
    }
}

fav.buttonPressed = { [weak counter] index in
    counter?.buttonPressed(at: index)
}

func incremental(_ i: inout Int) -> Int {
    i = i + 1
    return i
}

var i = 0  let i = 0
incremental(&i)

var numbers = [1, 2, 3]
incremental(&numbers[0])

struct Color {
    var r: Int
    var g: Int
    var b: Int
}

var red = Color(r: 254, g: 0, b: 0)
incremental(&red.r

struct Color {
    var r: Int
    var g: Int
    var b: Int

    var hex: Int {
        return r << 16 + g << 8 + b
    }
}

var red = Color(r: 255, g: 0, b: 0)

incremental(&red.hex)

prefix func ++(i: inout Int) -> Int {
    i += 1
    return i
}

func doubleIncrement(_ i: inout Int) {
    func increment() {
        i += 1
    }

    [0, 1].forEach { _ in increment() }
}

doubleIncrement(&i)

func increment(_ i: inout Int) -> () -> Void {
    return {
        i += 1
    }
}

func incrementByReference(_ pointer: UnsafeMutablePointer<Int>) {
    pointer.pointee += 1
}

incrementByReference(&i)

func incrementByReference(
    _ pointer: UnsafeMutablePointer<Int>) -> () -> Int {
    return { _ in
        pointer.pointee += 1
        return pointer.pointee
    }
}

let boom: () -> Int

if true {
    var j = 0
    boom = incrementByReference(&j)
}

boom()

let numbers: [Int] = [1, 2, 3]

if !numbers.isEmpty && numbers[0] > 0 {
    //
}

func logicAnd(_ l: Bool, _ r: Bool) -> Bool {
    guard l else { return false }
    
    return r
}

let numbers: [Int] = []


func logicAnd(_ l: Bool, _ r: () -> Bool) -> Bool {
    guard l else { return false }
    
    return r()
}

func logicAnd(_ l: Bool, _ r: @autoclosure () -> Bool) -> Bool {
    guard l else { return false }
    
    return r()
}

fav.buttonPressed = { [weak counter] index in
    counter?.buttonPressed(at: index)
}

func makeDescriptor<Key, Value>(
    key: @escaping (Key) -> Value,
    _ isAscending: @escaping (Value, Value) -> Bool
) -> SortDescriptor<Key> {

        return { isAscending(key($0), key($1)) }
}

func calc(_ n: Int, by: ((Int) -> Int)?) -> Int {
    guard let by = by else { return n }

    return by(n)
}
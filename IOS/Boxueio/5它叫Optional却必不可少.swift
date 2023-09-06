NSString *tmp = nil;

if ([tmp rangeOfString: @"Swift"].location != NSNotFound) {
    NSLog(@"Something about swift");
}

enum Optional<T> {
    case some(T)
    case none
}

extension Array where Element: Equatable {
    func find(_ element: Element) -> Optional<Index> {
        var index = startIndex

        while index != endIndex {
            if self[index] == element {
                return .some(index)
            }

            formIndex(after: &index)
        }

        return .none
    }
}

func find(_ element: Element) -> Index? {
    var index = startIndex

    while index != endIndex {
        if self[index] == element {
            return index 
        }

        formIndex(after: &index)
    }

    return nil 
}

switch index {
    case let index?:
        numbers.remove(at: index)
    case nil:
        print("Not exist")
}

let number: Int? = 1

if number != nil {
    print(number!)
}

if let number = number {
    print(number)
}

if let number = number, number % 2 != 0 {
    print(number)
}

if let url = URL(string: imageUrl), url.pathExtension == "jpg",
    let data = try? Data(contentsOf: url),
    let image = UIImage(data: data) {

    let view = UIImageView(image: image)
}

if let url = URL(string: imageUrl), url.pathExtension == "jpg",
    let data = try? Data(contentsOf: url),
    let image = UIImage(data: data) {

    let view = UIImageView(image: image)
}

var fnArray = [];

for (var i in [0, 1, 2]) {
    fnArray[i] = () => { console.log(i); };
}

fnArray[0]();
fnArray[1]();
fnArray[2]();

var fnArray: [()->()] = []

for i in 0...2 {
    fnArray.append({ print(i) })
}

fnArray[0]();
fnArray[1]();
fnArray[2]();

func arrayProcess(array: [Int]) {
    guard let first = array.first else {
        return
    }

    print(first)
}

func toDo(item: String?) -> Never {
    guard let item = item else {
        fatalError("Nothing to do")
    }

    fatalError("Implement \(item) later")
}

func arrayProcess(array: [Int]) -> String? {
    let firstNumber: Int

    if let first = array.first {
        firstNumber = first
    } else {
        return nil
    }

    return String(firstNumber)
}

var swift: String? = "Swift"
let SWIFT: String

if let swift = swift {
    SWIFT = swift.uppercased()
}
else {
    fatalError("Cannot uppercase a nil")
}

let SWIFT = swift?.uppercased()
let SWIFT = swift?.uppercased().lowercased()

extension String {
    func toUppercase() -> String? {
        guard self.isEmpty != 0 else {
            return nil
        }
        
        return self.uppercased()
    }
    
    func toLowercase() -> String? {
        guard self.characters.count != 0 else {
            return nil
        }
        
        return self.lowercased()
    }
}

let SWIFT1 = swift?.toUppercase()?.toLowercase()

let numbers = ["fibo6": [0, 1, 1, 2, 3, 5]]
numbers["fibo6"]?[0]

let a: String? = nil
let b: String? = nil
let c: String? = "C"

let theFirstNonNilString = a ?? b ?? c

let stringOnes: [String] = ["1", "One"]
let intOnes = stringOnes.map { Int($0) }
intOnes.forEach { print($0) 

var i = intOnes.makeIterator()

while let i = i.next() {
    print(i)
}

for case let one? in intOnes {
    print(one)
}

for case nil in intOnes {
    print("got a nil value")
}

let swift: String? = "swift"
var SWIFT: String? = nil

if let swift = swift {
    SWIFT = swift.uppercased()
}

extension Optional {
    func myMap<T>(_ transform: (Wrapped) -> T) -> T? {
        if let value = self {
            return transform(value)
        }

        return nil
    }
}

let SWIFT = swift.myMap { $0.uppercased() }

let numbers = [1, 2, 3, 4]
let sum = numbers.reduce(0, +)

extension Array {
    func reduce(_ nextResult:
        (Element, Element) -> Element) -> Element? {

        return first.map {
            dropFirst().reduce($0, nextResult)
        }
    }
}

let stringOne: String? = "1"
let ooo = stringOne.map { Int($0) }
type(of: ooo)

if let stringOne = stringOne, let o = Int(stringOne) {
    print(o)    // 1
    type(of: o) // Int
}

extension Optional {
    func myFlatMap<T>(_ transform: (Wrapped) -> T?) -> T? {
        if let value = self,
            let mapped = transform(value) {
            return mapped
        }

        return nil
    }
}

extension Sequence {
    func myFlatMap<T>(_ transform:
        (Iterator.Element) -> T?) -> [T] {
        return self.map(transform)
            .filter { $0 != nil }
            .map { $0! }
    }
}

let all = ints.myFlatMap { Int($0) }.reduce(0, +)
let intOnes = ints.flatMap { Int($0) }.reduce(0, +)

extension Sequence {
    func myFlatMap<T>(_ transform:
        (Iterator.Element) -> T?) -> [T] {
        return self.map(transform)
            .filter { $0 != nil }
            .map { $0! } 
    }
}

let episodes = [
    "The fail of sentinal values": 100,
    "Common optional operation": 150,
    "Nested optionals": 180,
    "Map and flatMap": 220,
]

episodes.keys
    .filter { episodes[$0]! > 100 }
    .sorted()

episodes.filter { (_, duration) in duration > 100 }
    .map { (title, _) in title }
    .sorted()

var record = ["name": "11"]
record["type"] !! "Do not have a key named type"

infix operator !!

func !!<T>(optional: T?,
    errorMsg: @autoclosure () -> String) -> T {

    if let value = optional { return value }
    fatalError(errorMsg)
}

infix operator !?

func !?<T: ExpressibleByStringLiteral>(
        optional: T?,
        errorMsg: @autoclosure () -> String) -> T {
    assert(optional != nil, errorMsg())
    return optional ?? ""
}

record["type"] !? "Do not have a key named type"

func !?<T: ExpressibleByStringLiteral>(
    optional: T?,
    nilDefault: @autoclosure () -> (errorMsg: String, value: T)) -> T {

    assert(optional != nil, nilDefault().errorMsg)
    return optional ?? nilDefault().value
}

record["type"] !? ("Do not have a key named type", "Free")

record["type"]?.write(" account")

func !?(optional: Void?, errorMsg: @autoclosure () -> String) {
    assert(optional != nil, errorMsg())
}

record["type"]?
    .write(" account")
    !? "Do not have a key named type"

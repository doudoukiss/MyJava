var x: Int!
let y = x // Int?

func id<T>(_ value: T) -> T { return value }
type(of: id(x)) // Int?
func forcedResult() -> Int! { return x }
type(of: forcedResult) // () -> Optional<Int>

func apply<T>(_ fn: () -> T) -> T { return fn() }

// Error: Value of optional type 'Int?' not unwrapped
let n: Int = apply(forcedResult)

class A: NSObject {}

class C {
    @objc var n: A! = A()
}
func getProperty(object: AnyObject) {
    type(of: object.n)

    if let n: A = object.n {
        type(of: n)
    }
}

func fn() throws -> Int! {
    return 11
}
if let value = try? fn() { // unwrap outer optional
    let n: Int = value // unwrap innner IUO
}
func switchDemo(_ input: String!) -> String {
    switch input {
    case let output?:
        return output
    default:
        return "nil"
    }
}

let values: [Any]! = [C()]
let transformed = values.map { $0 as! C }

enum Shape: CaseIterable {
    case rectangle
    case circle
    case triangle
}

Shape.allCases

public protocol CaseIterable {
  associatedtype AllCases: Collection where AllCases.Element == Self
  static var allCases: AllCases { get }
}

enum Shape: CaseIterable {
    case rectangle
    case circle(Double)
    case triangle
}

extension Shape: CaseIterable {
    public typealias AllCases = [Shape]

    public static var allCases: AllCases {
        return [Shape.rectangle, Shape.circle(1.0), Shape.triangle]
    }
}

extension Optional: CaseIterable where Wrapped: CaseIterable {
    public typealias AllCases = [Wrapped?]
    public static var allCases: AllCases {
        return Wrapped.allCases.map { $0 } + [nil]
    }
}

Double.random(in: 0 ... 1)
UInt8.random(in: 1 ..< 255)
Int.random(in: Int.min ... Int.max)

func coin(count: Int) -> Void {
    var result = (head: 0, back: 0)

    for _ in 1...count {
        if Bool.random() {
            result.head += 1
        }
        else {
            result.back += 1
        }
    }

    print("Head: \(result.head) Back: \(result.back)")
}

enum JSON {
    case intValue(Int)
    case stringValue(String)
    case arrayValue(Array<JSON>)
    case dictionaryValue(Dictionary<String, JSON>)
}


extension JSON {
    var stringValue: String? {
        if case .stringValue(let str) = self {
            return str
        }

        return nil
    }

    var intValue: Int? {
        if case .intValue(let str) = self {
            return str
        }

        return nil
    }
}

extension JSON {
    subscript(index: Int) -> JSON? {
        if case .arrayValue(let array) = self {
            return index < array.count ? array[index] : nil
        }

        return nil
    }

    subscript(key: String) -> JSON? {
        if case .dictionaryValue(let dic) = self {
            return dic[key]
        }

        return nil
    }
}

let json = JSON.dictionaryValue([
    "series": .arrayValue([
        .dictionaryValue(["title": .stringValue("What's new in Swift 4.2?")]),
        .dictionaryValue(["count": .intValue(5)])
    ])
])

json["series"]?[0]?["title"]?.stringValue

@dynamicMemberLookup
enum JSON {
    case intValue(Int)
    case stringValue(String)
    case arrayValue(Array<JSON>)
    case dictionaryValue(Dictionary<String, JSON>)
}

extension JSON {
    subscript(dynamicMember member: String) -> JSON? {
        if case .dictionaryValue(let dict) = self {
            return dict[member]
        }

        return nil
    }
}


public typealias Codable = Encodable & Decodable

fileprivate class __JSONEncoder : Encoder {
  fileprivate var storage: _JSONEncodingStorage

  fileprivate let options: JSONEncoder._Options

  public var codingPath: [CodingKey]
  public var userInfo: [CodingUserInfoKey : Any] {
      return self.options.userInfo
  }

  fileprivate init(
    options: JSONEncoder._Options,
    codingPath: [CodingKey] = []) {
      self.options = options
      self.storage = _JSONEncodingStorage()
      self.codingPath = codingPath
  }
}

fileprivate mutating func pushKeyedContainer() -> NSMutableDictionary {
  let dictionary = NSMutableDictionary()
  self.containers.append(dictionary)
  return dictionary
}

fileprivate mutating func pushUnkeyedContainer() -> NSMutableArray {
  let array = NSMutableArray()
  self.containers.append(array)
  return array
}

fileprivate mutating func push(container: __owned NSObject) {
  self.containers.append(container)
}

fileprivate mutating func popContainer() -> NSObject {
  precondition(!self.containers.isEmpty, "Empty container stack.")
  return self.containers.popLast()!
}

public protocol Encoder {
  var codingPath: [CodingKey] { get }
  var userInfo: [CodingUserInfoKey : Any] { get }

  func container<Key>(keyedBy type: Key.Type)
    -> KeyedEncodingContainer<Key>

  func unkeyedContainer() -> UnkeyedEncodingContainer

  func singleValueContainer() -> SingleValueEncodingContainer
}

struct User {
  let name: String
  let age: Double
}

extension User: Encodable {
  private enum CodingKeys: CodingKey {
    case name
    case age
  }

  public func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: .name)
    try container.encode(age, forKey: .age)
  }
}

let elev = User(name: "11", age: 11)
let data = try JSONEncoder().encode(elev)
let str = String(bytes: data, encoding: .utf8)!

print(str)

public func encode(to encoder: Encoder) throws {
  var container = encoder.unkeyedContainer()
  try container.encode(name)
  try container.encode(age)
}

fileprivate class __JSONEncoder : Encoder {
  public func singleValueContainer()
    -> SingleValueEncodingContainer {
      return self
  }
}

public protocol SingleValueEncodingContainer {
  var codingPath: [CodingKey] { get }

  mutating func encodeNil() throws

% for type in codable_types:
  mutating func encode(_ value: ${type}) throws
% end

  mutating func encode<T : Encodable>(_ value: T) throws
}

extension __JSONEncoder : SingleValueEncodingContainer {
  // MARK: - SingleValueEncodingContainer Methods
  fileprivate func assertCanEncodeNewValue() {
    precondition(self.canEncodeNewValue,
      "Attempt to encode value through single value container when previously value already encoded.")
  }

  public func encodeNil() throws {
    assertCanEncodeNewValue()
    self.storage.push(container: NSNull())
  }

  public func encode(_ value: Bool) throws {
    assertCanEncodeNewValue()
    self.storage.push(container: self.box(value))
  }

  public func encode<T : Encodable>(_ value: T) throws {
    assertCanEncodeNewValue()
    try self.storage.push(container: self.box(value))
  }
}

public protocol UnkeyedEncodingContainer {
  var count: Int { get }

  mutating func encodeConditional<T : AnyObject & Encodable>(_ object: T) throws

% for type in codable_types:
  mutating func encode<T : Sequence>(
    contentsOf sequence: T) throws where T.Element == ${type}
% end

  mutating func encode<T : Sequence>(
    contentsOf sequence: T) throws where T.Element : Encodable

  mutating func nestedContainer<NestedKey>(
    keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey>

  mutating func nestedUnkeyedContainer() -> UnkeyedEncodingContainer

  mutating func superEncoder() -> Encoder
}

fileprivate struct _JSONUnkeyedEncodingContainer : UnkeyedEncodingContainer {
  private let encoder: __JSONEncoder
  private let container: NSMutableArray
  private(set) public var codingPath: [CodingKey]

  public var count: Int {
      return self.container.count
  }

  fileprivate init(
    referencing encoder: __JSONEncoder,
    codingPath: [CodingKey],
    wrapping container: NSMutableArray) {
      self.encoder = encoder
      self.codingPath = codingPath
      self.container = container
  }
}

public protocol CodingKey :
  CustomStringConvertible, CustomDebugStringConvertible
{
  var stringValue: String { get }
  init?(stringValue: String)

  var intValue: Int? { get }
  init?(intValue: Int)
}

fileprivate struct _JSONKey : CodingKey {
  public var stringValue: String
  public var intValue: Int?

  public init?(stringValue: String) {
      self.stringValue = stringValue
      self.intValue = nil
  }

  public init?(intValue: Int) {
      self.stringValue = "\(intValue)"
      self.intValue = intValue
  }

  public init(stringValue: String, intValue: Int?) {
      self.stringValue = stringValue
      self.intValue = intValue
  }

  fileprivate init(index: Int) {
      self.stringValue = "Index \(index)"
      self.intValue = index
  }

  fileprivate static let `super` = _JSONKey(stringValue: "super")!
}

public protocol Decoder {
  var codingPath: [CodingKey] { get }
  var userInfo: [CodingUserInfoKey : Any] { get }

  func container<Key>(keyedBy type: Key.Type) throws
    -> KeyedDecodingContainer<Key>

  func unkeyedContainer() throws -> UnkeyedDecodingContainer

  func singleValueContainer() throws -> SingleValueDecodingContainer
}

fileprivate class __JSONDecoder : Decoder {
  fileprivate var storage: _JSONDecodingStorage

  fileprivate let options: JSONDecoder._Options
  fileprivate(set) public var codingPath: [CodingKey]
  public var userInfo: [CodingUserInfoKey : Any] {
      return self.options.userInfo
  }

  fileprivate init(
    referencing container: Any,
    at codingPath: [CodingKey] = [],
    options: JSONDecoder._Options) {
      self.storage = _JSONDecodingStorage()
      self.storage.push(container: container)
      self.codingPath = codingPath
      self.options = options
  }
}

public class Shape: Codable {
  public required init() {}
  public required init(from decoder: Decoder) throws {}

  public func getName() {
    fatalError("Shape is a general base.")
  }
}

public class Triangle: Shape {
  public required init() {
    super.init()
  }
  public required init(from decoder: Decoder) throws {
    try super.init(from: decoder)
  }

  public override func getName() {
    print("Triangle")
  }
}

public class Rectangle: Shape {
  public required init() {
    super.init()
  }
  public required init(from decoder: Decoder) throws {
    try super.init(from: decoder)
  }

  public override func getName() {
    print("Rectangle")
  }
}

public class Circle: Shape {
  public required init() {
    super.init()
  }
  public required init(from decoder: Decoder) throws {
    try super.init(from: decoder)
  }

  public override func getName() {
    print("Circle")
  }
}


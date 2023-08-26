protocol IteratorProtocol {
    associatedtype Element
    mutating func next() -> Element?
}

struct Ones: IteratorProtocol {
    mutating func next() -> Int? {
        return 1
    }
}

var ones = Ones()

ones.next()

struct Fibonacci: IteratorProtocol {
    private var state = (0, 1)

    mutating func next() -> Int? {
        let nextNumber = state.0
        self.state = (state.1, state.0 + state.1)

        return nextNumber
    }
}

var fibs = Fibonacci()

fibs.next()

protocol Sequence {
    associatedtype Element
    associatedtype Iterator: IteratorProtocol
        where Iterator.Element == Element
}

protocol Sequence {
    func makeIterator() -> Iterator
}

struct Fibonacci: Sequence {
    typealias Element = Int
    func makeIterator() -> FiboIter {
        return FiboIter()
    }
}

struct FiboIter: IteratorProtocol {
    var state = (0, 1)

    mutating func next() -> Int? {
        let nextNumber = state.0
        self.state = (state.1, state.0 + state.1)

        return nextNumber
    }
}

var fib1 = fibs.makeIterator()

fib1.next()

public func elementsEqual<OtherSequence: Sequence>(
    _ other: OtherSequence,
    by areEquivalent: (Element, OtherSequence.Element) throws -> Bool
  ) rethrows -> Bool

extension Sequence where Element : Equatable {
  @inlinable
  public func elementsEqual<OtherSequence: Sequence>(
    _ other: OtherSequence
  ) -> Bool where OtherSequence.Element == Element {
    return self.elementsEqual(other, by: ==)
  }
}

extension Sequence where Element : Equatable {
  static func ==<OtherSequence: Sequence>(
  lhs: Self, rhs: OtherSequence) -> Bool
    where Element == OtherSequence.Element {
      return lhs.elementsEqual(rhs)
  }
}

extension Sequence {
  @inlinable
  public func forEach(
    _ body: (Element) throws -> Void
  ) rethrows {
    for element in self {
      try body(element)
    }
  }
}

extension Sequence {
  @inlinable
  public func enumerated() -> EnumeratedSequence<Self> {
    return EnumeratedSequence(_base: self)
  }
}

@_fixed_layout
public struct EnumeratedSequence<Base: Sequence> {
  @usableFromInline
  internal var _base: Base

  /// Construct from a `Base` sequence.
  @inlinable
  internal init(_base: Base) {
    self._base = _base
  }
}

extension EnumeratedSequence: Sequence {
  /// Returns an iterator over the elements of this sequence.
  @inlinable
  public func makeIterator() -> EnumeratedIterator<Base.Iterator> {
    return EnumeratedIterator(_base: _base.makeIterator())
  }
}

@_fixed_layout
public struct EnumeratedIterator<Base: IteratorProtocol> {
  @usableFromInline
  internal var _base: Base
  @usableFromInline
  internal var _count: Int

  /// Construct from a `Base` iterator.
  @inlinable
  internal init(_base: Base) {
    self._base = _base
    self._count = 0
  }
}

extension EnumeratedIterator: IteratorProtocol, Sequence {
  public typealias Element = (offset: Int, element: Base.Element)

  @inlinable
  public mutating func next() -> Element? {
    guard let b = _base.next() else { return nil }
    let result = (offset: _count, element: b)
    _count += 1
    return result
  }
}

extension Sequence {
  @inlinable
  public func map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    let initialCapacity = underestimatedCount
    var result = ContiguousArray<T>()
    result.reserveCapacity(initialCapacity)

    var iterator = self.makeIterator()

    for _ in 0..<initialCapacity {
      result.append(try transform(iterator.next()!))
    }
    
    while let element = iterator.next() {
      result.append(try transform(element))
    }
    return Array(result)
  }
}

extension Sequence {
  @inlinable
  public func flatMap<SegmentOfResult : Sequence>(
    _ transform: (Element) throws -> SegmentOfResult
  ) rethrows -> [SegmentOfResult.Element] {
    var result: [SegmentOfResult.Element] = []
    for element in self {
      result.append(contentsOf: try transform(element))
    }
    return result
  }
}

extension Sequence {
  @inline(__always)
  @available(swift, deprecated: 4.1, renamed: "compactMap(_:)",
    message: "Please use compactMap(_:) for the case where closure returns an optional value")
  public func flatMap<ElementOfResult>(
    _ transform: (Element) throws -> ElementOfResult?
  ) rethrows -> [ElementOfResult] {
    return try _compactMap(transform)
  }
}

@available(swift,
  deprecated: 4.1,
  renamed: "compactMap(_:)",
  message: "Please use compactMap(_:) for the case where closure returns an optional value")

extension Sequence {
  @inlinable // FIXME(sil-serialize-all)
  @inline(__always)
  public func _compactMap<ElementOfResult>(
    _ transform: (Element) throws -> ElementOfResult?
  ) rethrows -> [ElementOfResult] {
    var result: [ElementOfResult] = []
    for element in self {
      if let newElement = try transform(element) {
        result.append(newElement)
      }
    }
    return result
  }
}

@_show_in_interface
public // @testable
protocol _SequenceWrapper : Sequence {
  associatedtype Base : Sequence where Base.Element == Element
  associatedtype Iterator = Base.Iterator
  associatedtype SubSequence = Base.SubSequence

  var _base: Base { get }
}

extension _SequenceWrapper {
  @inlinable // FIXME(sil-serialize-all)
  public func map<T>(
    _ transform: (Element) throws -> T
  ) rethrows -> [T] {
    return try _base.map(transform)
  }
}

extension Sequence {
  @inlinable // FIXME(sil-serialize-all)
  public var lazy: LazySequence<Self> {
    return LazySequence(_base: self)
  }
}

@_fixed_layout // FIXME(sil-serialize-all)
public struct LazySequence<Base : Sequence>: _SequenceWrapper {
  public var _base: Base

  @inlinable // FIXME(sil-serialize-all)
  internal init(_base: Base) {
    self._base = _base
  }
}

extension LazySequence: LazySequenceProtocol {
  public typealias Elements = Base

  @inlinable // FIXME(sil-serialize-all)
  public var elements: Elements { return _base }
}

public protocol LazySequenceProtocol : Sequence {
  associatedtype Elements : Sequence = Self
    where Elements.Iterator.Element == Iterator.Element

  var elements: Elements { get }
}

extension LazySequenceProtocol {
  @inlinable // FIXME(sil-serialize-all)
  public var lazy: LazySequence<Elements> {
    return elements.lazy
  }
}

extension LazySequenceProtocol
  where Elements: LazySequenceProtocol {
  @inlinable // FIXME(sil-serialize-all)
  public var lazy: Elements {
    return elements
  }
}

extension LazySequenceProtocol where Elements == Self {
  /// Identical to `self`.
  @inlinable // FIXME(sil-serialize-all)
  public var elements: Self { return self }
}


public protocol Sequence {
  associatedtype Element
  func makeIterator() -> Iterator
}

public protocol IteratorProtocol {
  associatedtype Element
  mutating func next() -> Element?
}

internal struct _ClosureBasedIterator<Element> : IteratorProtocol {
  internal init(_ body: @escaping () -> Element?) {
    self._body = body
  }

  internal func next() -> Element? { return _body() }
  internal let _body: () -> Element?
}

internal class _AnyIteratorBoxBase<Element> : IteratorProtocol {
  internal init() {}
  deinit {}
  internal func next() -> Element? { _abstract() }
}

internal final class _IteratorBox<
  Base : IteratorProtocol
> : _AnyIteratorBoxBase<Base.Element> {
  internal init(_ base: Base) { self._base = base }

  deinit {}

  internal override func next() -> Base.Element? {
    return _base.next()
  }

  internal var _base: Base
}

public struct AnySequence<Element> {
  internal let _box: _AnySequenceBox<Element>

  public init<I : IteratorProtocol>(
    _ makeUnderlyingIterator: @escaping () -> I
  ) where I.Element == Element {
    self.init(_ClosureBasedSequence(makeUnderlyingIterator))
  }

  internal init(_box: _AnySequenceBox<Element>) {
    self._box = _box
  }
}

extension  AnySequence: Sequence {
  public typealias Iterator = AnyIterator<Element>

  public init<S : Sequence>(_ base: S)
    where
    S.Element == Element {
    self._box = _SequenceBox(_base: base)
  }
}

let stdin = AnySequence(InputStream())

let fibs = AnySequence<Int> {
  () -> AnyIterator<Int> in

  var state = (curr: 0, next: 1)

  return AnyIterator {
    let curr = state.curr
    state = (curr: state.next, next: state.curr + state.next)

    return curr
  }
}

internal func dropFirst(_ k: Int) -> AnySequence<Base.Element> {
  return AnySequence(
    _DropFirstSequence(
      _iterator: _iterator, limit: _limit + k, dropped: _dropped))
}

extension Sequence {
  public func dropFirst(_ k: Int = 1) -> DropFirstSequence<Self>
  public func dropLast(_ k: Int = 1) -> [Element]

  public func suffix(_ maxLength: Int) -> [Element]
  public func prefix(_ maxLength: Int) -> PrefixSequence<Self>

  public func drop(
    while predicate: (Element) throws -> Bool
  ) rethrows -> DropWhileSequence<Self>

  public func prefix(
    while predicate: (Element) throws -> Bool
  ) rethrows -> [Element]

  public func split(
    maxSplits: Int = Int.max,
    omittingEmptySubsequences: Bool = true,
    whereSeparator isSeparator: (Element) throws -> Bool
  ) rethrows -> [ArraySlice<Element>]
}

public __consuming func dropLast(_ k: Int = 1) -> [Element] {
  _precondition(k >= 0,
    "Can't drop a negative number of elements from a sequence")
  guard k != 0 else { return Array(self) }

  var result = ContiguousArray<Element>()
  var ringBuffer = ContiguousArray<Element>()
  var i = ringBuffer.startIndex

  for element in self {
    if ringBuffer.count < k {
      ringBuffer.append(element)
    } else {
      result.append(ringBuffer[i])
      ringBuffer[i] = element
      i = (i + 1) % k
    }
  }

  return Array(result)
}

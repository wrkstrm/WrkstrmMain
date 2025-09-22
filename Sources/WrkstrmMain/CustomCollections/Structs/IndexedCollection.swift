/// A collection wrapper that provides both the index and element of each entry in a
/// `RandomAccessCollection`.
///
/// `IndexedCollection` is a generic struct that takes any `RandomAccessCollection` and provides
/// access to both the index and the element of each entry in the collection. This is particularly
/// useful when you need both the value and the position of each element in the collection.
///
/// Example:
/// ```
/// let array = ["a", "b", "c"]
/// let indexedCollection = IndexedCollection(base: array)
/// for item in indexedCollection {
///   print("Element: \(item.element) at index: \(item.index)")
/// }
/// ```
public struct IndexedCollection<Base: RandomAccessCollection>: RandomAccessCollection {
  /// The type of index used in the base collection.
  public typealias Index = Base.Index

  /// The type of element represented as a tuple containing both the index and the element.
  public typealias Element = (index: Index, element: Base.Element)

  /// The base collection.
  public let base: Base

  /// Creates an indexed view over the provided base collection.
  /// - Parameter base: The collection to wrap.
  public init(base: Base) { self.base = base }

  /// The start index of the collection.
  public var startIndex: Index { base.startIndex }

  /// The end index of the collection.
  public var endIndex: Index { base.endIndex }

  /// The last element in the collection, if any.
  public var last: Element? {
    guard let lastIndex = base.indices.last else { return nil }
    return (index: lastIndex, element: base[lastIndex])
  }

  /// Returns the index immediately after the given index.
  ///
  /// - Parameter i: A valid index of the collection. `i` must be less than `endIndex`.
  /// - Returns: The index value immediately after `i`.
  public func index(after i: Index) -> Index {
    base.index(after: i)
  }

  /// Returns the index immediately before the given index.
  ///
  /// - Parameter i: A valid index of the collection. `i` must be greater than `startIndex`.
  /// - Returns: The index value immediately before `i`.
  public func index(before i: Index) -> Index {
    base.index(before: i)
  }

  /// Returns an index that is the specified distance from the given index.
  ///
  /// - Parameters:
  ///   - i: A valid index of the collection.
  ///   - distance: The distance to offset `i`.
  /// - Returns: An index offset by `distance` from the index `i`. If `distance` is positive, this
  /// is the same value that would be returned by the default implementation of
  /// `index(_:offsetBy:)`. If `distance` is negative, this is the same value that would be
  /// returned by the default implementation of `index(_:offsetBy:)`.
  public func index(_ i: Index, offsetBy distance: Int) -> Index {
    base.index(i, offsetBy: distance)
  }

  /// Accesses the element at the specified position.
  ///
  /// This subscript provides access to the element and its index in the collection. The returned
  /// tuple
  /// contains both the index and the element at that index.
  ///
  /// - Parameter position: The position of the element to access. `position` must be a valid index
  /// of the collection that is not equal to the `endIndex`.
  /// - Returns: A tuple containing both the index and the element at position `position`.
  public subscript(position: Index) -> Element {
    (index: position, element: base[position])
  }
}

/// A generic collection that maintains its elements in sorted order.
public struct SortedArray<Element>: Collection {
  /// An enum representing the result of a search in a sorted array.
  ///
  /// - found(at: N): Indicates that the item was found at a specific index.
  /// - notFound(insertAt: N): Indicates that the item was not found, but can be inserted at the
  /// specified index to maintain sort order.
  public enum SearchResult<N: Numeric> {
    /// The item was found at the specified index.
    case found(at: N)
    /// The item was not found, but can be inserted at the specified index to maintain sort order
    case notFound(insertAt: N)
  }

  /// A type alias for a comparator function used to define the sort order of the elements.
  public typealias Comparator<A> = (A, A) -> Bool

  /// The array of elements, kept in sorted order.
  public var elements: [Element]

  /// The sorting order function used to maintain the sorted state of the array.
  public let sortOrder: Comparator<Element>

  // MARK: - Collection Protocol Implementation Variables

  /// The start index of the collection.
  public var startIndex: Int { elements.startIndex }

  /// The end index of the collection.
  public var endIndex: Int { elements.endIndex }

  public var last: Element? { elements.last }

  /// Accesses the element at the specified position.
  public subscript(index: Int) -> Element { elements[index] }

  /// Initializes a new sorted array from an unsorted sequence.
  ///
  /// The elements are sorted using the provided comparator.
  /// - Parameters:
  ///   - unsorted: A sequence of unsorted elements.
  ///   - sortOrder: A comparator function that defines the sort order.
  public init<S: Sequence>(
    unsorted: S,
    sortOrder: @escaping Comparator<S.Element>,
  ) where S.Element == Element {
    elements = unsorted.sorted(by: sortOrder)
    self.sortOrder = sortOrder
  }

  /// Inserts an element into the sorted array.
  ///
  /// This method performs a binary search to find the correct insertion index for the new element
  /// to maintain the sorted order.
  /// - Parameter element: The element to insert.
  public mutating func insert(_ element: Element) {
    switch search(for: element) {
    case .found(at: let index):
      elements.insert(element, at: index)

    case .notFound(insertAt: let index):
      elements.insert(element, at: index)
    }
  }

  /// Performs a binary search for a given element in the sorted array.
  ///
  /// Returns a `SearchResult` indicating the position where the element is found or should be
  /// inserted.
  /// - Parameter element: The element to search for.
  /// - Returns: The search result as `SearchResult<Int>`.
  public func search(for element: Element) -> SearchResult<Int> {
    var start: Int = elements.startIndex
    var end: Int = elements.endIndex
    while start < end {
      let mid: Int = start + (end - start) / 2
      if sortOrder(elements[mid], element) {
        start = mid + 1
      } else if sortOrder(element, elements[mid]) {
        end = mid
      } else {
        return .found(at: mid)
      }
    }
    return .notFound(insertAt: start)
  }

  // MARK: - Collection Protocol Implementation Functions

  /// Returns the position immediately after the given index.
  public func index(after i: Int) -> Int { elements.index(after: i) }

  /// Returns the smallest element in the collection.
  public func min() -> Element? { elements.first }

  /// Returns the largest element in the collection.
  public func max() -> Element? { elements.last }
}

/// Extension of `SortedArray` for types that conform to `Comparable`.
extension SortedArray where Element: Comparable {
  /// Initializes an empty sorted array for `Comparable` elements.
  public init() {
    self.init(unsorted: [Element](), sortOrder: <)
  }

  /// Initializes a sorted array from a sequence of `Comparable` elements.
  public init(unsorted: some Sequence<Element>) {
    self.init(unsorted: unsorted, sortOrder: <)
  }
}

/// Extension of `Array` for `Comparable` elements, providing a convenience method to create a
/// `SortedArray`.
extension Array where Element: Comparable {
  /// A computed property that returns a `SortedArray` containing the array's elements.
  public var sortedArray: SortedArray<Element> { SortedArray(unsorted: self) }
}

/// Represents a recursive list data structure with elements of type `A`.
/// - Note: This enum is designed to work with singly-linked and doubly-linked lists.
/// - Parameter A: The type of elements in the list, which must conform to `Equatable`.
public indirect enum List<A: Equatable>: Sequence, Equatable {
  /// Represents a double element in the list, which has both a previous and a next element.
  /// - Parameters:
  ///   - previous: The optional reference to the previous element.
  ///   - current: The value of the current element.
  ///   - next: The optional reference to the next element.
  case double(previous: List<A>?, current: A, next: List<A>?)

  /// Represents a single element in the list.
  /// - Parameters:
  ///   - element: The value of the current element.
  ///   - next: The optional reference to the next element in the list.
  case single(A, next: List<A>?)

  /// An iterator for traversing the elements of the list.
  public struct Iterator: IteratorProtocol {
    var list: List<A>?

    /// Advances the iterator to the next element in the list.
    /// - Returns: The next element in the list, or `nil` if there are no more elements.
    public mutating func next() -> List<A>? {
      switch list {
        case let .single(_, next):
          list = next
          return next

        case let .double(previous: _, current: _, next: next):
          list = next

        default:
          return nil
      }
      return nil
    }
  }

  // MARK: - Equatable

  /// Compares two lists for equality.
  /// - Parameters:
  ///   - lhs: The left-hand side list to compare.
  ///   - rhs: The right-hand side list to compare.
  /// - Returns: `true` if the two lists are equal, `false` otherwise.
  public static func == (lhs: List<A>, rhs: List<A>) -> Bool {
    switch lhs {
      case let .single(lhsElement, lhsNext):
        switch rhs {
          case let .single(rhsElement, rhsNext):
            lhsElement == rhsElement && lhsNext == rhsNext

          default:
            false
        }

      case let .double(previous: lhsPrevious, current: lhsCurrent, next: lhsNext):
        switch rhs {
          case let .double(previous: rhsPrevious, current: rhsCurrent, next: rhsNext):
            lhsPrevious == rhsPrevious && lhsCurrent == rhsCurrent && lhsNext == rhsNext

          default:
            false
        }
    }
  }

  // MARK: - Sequence

  /// Creates an iterator for traversing the elements of the list.
  /// - Returns: An iterator that starts at the beginning of the list.
  public func makeIterator() -> Iterator { Iterator(list: self) }
}

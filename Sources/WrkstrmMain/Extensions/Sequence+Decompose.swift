/// An extension for `Sequence`.
/// This extension provides various methods for decomposing, matching, and batching elements in a
/// sequence.
extension Sequence {
  // MARK: - Decompose

  /// Decomposes the sequence into the first element matching the given predicate and the rest of
  /// the elements.
  ///
  /// This method iterates through the sequence, finding the first element that satisfies the
  /// predicate and separating it from the others.
  /// - Parameter predicate: A closure that takes an element of the sequence as its argument and
  /// returns a `Bool` value indicating whether the element should be selected as the first.
  /// - Returns: A tuple containing the first matching element and an array of the remaining
  /// elements.
  public func decomposeFirst(with predicate: (Element) -> Bool) -> (Element?, [Element]) {
    var first: Element?
    var others: [Element] = []
    var iterator: Iterator = makeIterator()
    while let item = iterator.next() {
      if first == nil, predicate(item) {
        first = item
      } else {
        others.append(item)
      }
    }
    return (first, others)
  }

  /// Decomposes the sequence into its first element and the rest.
  ///
  /// This is a convenience method that provides the first element of the sequence and an array of
  /// the remaining elements.
  /// - Returns: A tuple containing the first element and an array of the remaining elements.
  public func decompose() -> (Element?, [Element]) {
    decomposeFirst { _ in true }
  }

  /// Decomposes the sequence into all elements matching the given predicate and the rest of the
  /// elements.
  ///
  /// This method iterates through the sequence, accumulating elements that satisfy the predicate
  /// and separating them from the others.
  /// - Parameter predicate: A closure that takes an element of the sequence as its argument and
  /// returns a `Bool` value indicating whether the element should be included in the matching
  /// group.
  /// - Returns: A tuple containing an array of all matching elements and an array of the remaining
  /// elements.
  public func decomposeAll(with predicate: (Element) -> Bool) -> ([Element]?, [Element]) {
    var all: [Element] = []
    var others: [Element] = []
    var iterator = makeIterator()
    while let item = iterator.next() {
      if predicate(item) {
        all.append(item)
      } else {
        others.append(item)
      }
    }
    return (all.isEmpty ? nil : all, others)
  }

  /// Decomposes the sequence into elements matching the predicate until a non-matching element is
  /// encountered, along with the rest.
  ///
  /// This method iterates through the sequence, accumulating elements that satisfy the predicate
  /// until a non-matching element is found. The remaining elements are returned as a separate
  /// array.
  /// - Parameter predicate: A closure that takes an element of the sequence as its argument and
  /// returns a `Bool` value indicating whether the element should be included in the accumulated
  /// group.
  /// - Returns: A tuple containing an array of accumulated matching elements and an array of the
  /// remaining elements.
  public func decomposeUntil(with predicate: (Element) -> Bool) -> ([Element]?, [Element]) {
    var all: [Element] = []
    var others: [Element] = []
    var iterator: Iterator = makeIterator()
    var continueAccumulation = true
    while let item = iterator.next() {
      if predicate(item), continueAccumulation {
        all.append(item)
      } else {
        continueAccumulation = false
        others.append(item)
      }
    }
    return (all.isEmpty ? nil : all, others)
  }

  // MARK: - Contain

  /// Determines if all elements in the sequence match the given predicate.
  ///
  /// This method returns `true` if all elements in the sequence satisfy the given predicate.
  /// - Parameter predicate: A closure that takes an element of the sequence as its argument and
  /// returns a `Bool` value indicating whether the element matches the condition.
  /// - Returns: `true` if all elements match the predicate; otherwise, `false`.
  public func allMatch(_ predicate: (Element) -> Bool) -> Bool {
    !contains { !predicate($0) }
  }

  /// Determines if none of the elements in the sequence match the given predicate.
  ///
  /// This method returns `true` if no elements in the sequence satisfy the given predicate.
  /// - Parameter predicate: A closure that takes an element of the sequence as its argument and
  /// returns a `Bool` value indicating whether the element matches the condition.
  /// - Returns: `true` if no elements match the predicate; otherwise, `false`.
  public func noneMatch(_ predicate: (Element) -> Bool) -> Bool {
    !contains { predicate($0) }
  }

  // MARK: - Batching

  /// Groups elements into batches based on a given predicate.
  ///
  /// This method iterates through the sequence, creating batches of elements. A new batch starts
  /// whenever the predicate dictates.
  /// - Parameter predicate: A closure that takes the current batch and the next element as its
  /// arguments and returns a Boolean value indicating whether the element should start a new
  /// batch.
  /// - Returns: An array of batches, each a subarray of elements.
  public func batches(by predicate: ([Element], Element) -> Bool) -> [[Element]] {
    var all: [[Element]] = []
    var batch: [Element] = []
    var iterator: Iterator = makeIterator()
    while let item = iterator.next() {
      if !predicate(batch, item) {
        all.append(batch)
        batch = [Element]()
      }
      batch.append(item)
    }
    all.append(batch)
    return all
  }

  /// Splits the sequence into batches of a specified size.
  ///
  /// This method divides the sequence into batches, each containing a specified number of elements,
  /// except possibly the last batch.
  /// - Parameter batchSize: The maximum number of elements in each batch.
  /// - Returns: An array of batches, each a subarray of elements.
  public func split(batchSize: Int) -> [[Element]] {
    batches { batch, _ in batch.count < batchSize }
  }
}

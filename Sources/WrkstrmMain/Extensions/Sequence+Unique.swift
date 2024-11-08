extension Sequence where Iterator.Element: Hashable {
  /// Returns an array containing the unique elements of the sequence.
  ///
  /// - Note:
  ///   The order of the elements is preserved and the first occurrence
  ///   of each element is used. For example, given the sequence
  ///   [1, 2, 3, 1, 2], the unique elements are [1, 2, 3]. The order of
  ///   the elements is preserved, so the result is [1, 2, 3].
  ///
  /// - Returns: An array containing the unique elements of the sequence.
  func unique() -> [Iterator.Element] {
    Array(reduce(into: Set<Iterator.Element>()) { $0.insert($1) })
  }
}

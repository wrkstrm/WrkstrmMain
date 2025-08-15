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
    var seen = Set<Iterator.Element>()
    var result: [Iterator.Element] = []
    for element in self where seen.insert(element).inserted {
      result.append(element)
    }
    return result
  }
}

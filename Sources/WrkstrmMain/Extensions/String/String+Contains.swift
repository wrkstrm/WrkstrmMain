/// An extension on `String` providing utility methods for character uniqueness and permutation
/// checking.
extension String {
  /// Checks whether the string contains all unique characters.
  ///
  /// This method iterates through the characters of the string, storing them in a set to check for
  /// uniqueness. If any character is found more than once, the method returns `false`; otherwise,
  /// it returns `true`.
  ///
  /// For example, "abc" returns `true`, but "aabb" returns `false`.
  ///
  /// - Returns: `true` if the string contains only unique characters, otherwise `false`.
  public func containsUniqueChars() -> Bool {
    var set = Set<Character>()
    for character in self {
      if set.contains(character) {
        return false
      } else {
        set.insert(character)
      }
    }
    return true
  }

  /// Determines if the string is a permutation of another string using a simple heuristic.
  ///
  /// This approach compares the two strings' lengths and the sum of their Unicode scalar values.
  /// - Warning: This heuristic only works when each string's Unicode scalar values are unique—no
  ///   repeated characters or shared scalar values. If characters repeat, the result may be
  ///   incorrect. Intended for quick checks on strings known to contain unique characters; for
  ///   general-purpose permutation tests, use a frequency-count algorithm instead.
  ///
  /// For example, "abc" and "cab" are permutations, but "aab" and "aba" are not handled
  /// correctly by this heuristic.
  ///
  /// - Parameter other: The string to compare against.
  /// - Returns: `true` if the string is a permutation of the other string, otherwise `false`.
  public func isPermutation(_ other: String) -> Bool {
    guard count == other.count else { return false }
    return unicodeScalars.reduce(0) { $0 + $1.value }
      == other.unicodeScalars.reduce(0) { $0 + $1.value }
  }
}

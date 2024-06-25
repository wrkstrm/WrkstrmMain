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

  /// Determines if the string is a permutation of another string.
  ///
  /// This method checks if two strings have the same character count and the same sum of Unicode
  /// scalar values, which implies that one string is a permutation of the other.
  ///
  /// Note: This method assumes that the strings consist of characters with unique Unicode scalar
  /// values.For strings with characters having the same scalar values, this method may produce
  /// incorrect results.
  ///
  /// For example, "abc" and "cab" are permutations, but "abc" and "def" are not.
  ///
  /// - Parameter other: The string to compare against.
  /// - Returns: `true` if the string is a permutation of the other string, otherwise `false`.
  public func isPermutation(_ other: String) -> Bool {
    guard count == other.count else { return false }
    return unicodeScalars.reduce(0) { $0 + $1.value }
      == other.unicodeScalars.reduce(0) { $0 + $1.value }
  }
}

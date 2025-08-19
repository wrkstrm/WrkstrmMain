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

  /// Determines if the string is a permutation of another string using a
  /// frequency count of characters.
  ///
  /// Each string's characters are tallied and compared to ensure both strings
  /// contain the same characters with the same frequencies. This approach
  /// handles repeated characters correctly and runs in O(*n*) time.
  ///
  /// - Parameter other: The string to compare against.
  /// - Returns: `true` if the string is a permutation of the other string, otherwise `false`.
  public func isPermutation(_ other: String) -> Bool {
    guard count == other.count else { return false }

    var characterCounts: [Character: Int] = [:]

    for character in self {
      characterCounts[character, default: 0] += 1
    }

    for character in other {
      guard let current = characterCounts[character] else { return false }
      if current == 1 {
        characterCounts.removeValue(forKey: character)
      } else {
        characterCounts[character] = current - 1
      }
    }

    return characterCounts.isEmpty
  }
}

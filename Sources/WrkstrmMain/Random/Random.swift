/// A namespace for generating random string sequences using printable ASCII characters.
public enum Random {
  //MARK: - Public
  /// Returns a random string made up of printable ASCII characters (U+0020 to U+007E).
  ///
  /// - Parameters:
  ///   - length: The number of characters to generate.
  ///   - noConfusing: If true, avoids characters like `0`, `O`, `1`, `l`, `I`.
  /// - Returns: A random printable ASCII string.
  public static func printableASCII(length: Int, noConfusing: Bool = false)
    -> String
  {
    let table = noConfusing ? safeASCII : asciiTable
    return String((0..<length).compactMap { _ in table.randomElement() })
  }

  //MARK: - Private

  /// All printable ASCII characters (U+0020 to U+007E).
  private static let asciiTable: [Character] = {
    (32...126).compactMap { UnicodeScalar($0).map(Character.init) }
  }()

  /// Unambiguous ASCII: removes 0, O, 1, l, I and similar confusables.
  /// Inspired by Base58 and password safety practices.
  private static let safeASCII: [Character] = Array(
    "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!@#$%^&*"
  )
}

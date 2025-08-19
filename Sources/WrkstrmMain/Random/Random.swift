/// A namespace for generating random string sequences from printable characters and emoji.
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

  /// Returns a random string of single-scalar emoji with default emoji presentation.
  ///
  /// - Parameter length: Number of emoji to generate.
  /// - Returns: A string composed of printable emoji.
  public static func emoji(length: Int) -> String {
    String((0..<length).compactMap { _ in emojiTable.randomElement() })
  }

  /// Returns a string with mixed printable ASCII and emoji characters.
  /// Emoji characters follow the same restrictions as ``emoji(length:)``
  /// (single Unicode scalar with default emoji presentation).
  ///
  /// - Parameters:
  ///   - length: Number of characters to generate.
  ///   - noConfusing: If true, avoids visually similar ASCII characters.
  /// - Returns: A mixed string of ASCII and emoji characters.
  public static func mixed(length: Int, noConfusing: Bool = false) -> String {
    let table = noConfusing ? safeMixed : allTable
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

  /// Emoji characters that:
  /// - are a single Unicode scalar
  /// - have default emoji presentation
  /// - stand alone as individual grapheme clusters (exclude modifiers/selectors)
  private static let emojiTable: [Character] = {
    (0...0x10FFFF).compactMap { cp in
      guard let scalar = UnicodeScalar(cp), isStandaloneEmoji(scalar) else {
        return nil
      }
      return Character(scalar)
    }
  }()

  /// Standalone emoji restriction used throughout the module.
  /// - The scalar must itself be an emoji (no multi-scalar sequences).
  /// - It must default to the emoji presentation.
  /// - Modifiers and variation selectors are excluded.
  static func isStandaloneEmoji(_ scalar: UnicodeScalar) -> Bool {
    scalar.properties.isEmoji && scalar.properties.isEmojiPresentation
      && scalar.properties.isGraphemeBase && !scalar.properties.isEmojiModifier
      && !scalar.properties.isVariationSelector
  }

  /// All printable characters: ASCII + emoji.
  private static let allTable: [Character] = asciiTable + emojiTable

  /// Safe mixed table (unambiguous ASCII + emoji).
  private static let safeMixed: [Character] = safeASCII + emojiTable
}

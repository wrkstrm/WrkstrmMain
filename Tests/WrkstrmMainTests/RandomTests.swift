import Testing

@testable import WrkstrmMain

struct RandomTests {

  // MARK: - Zero-length checks
  // These tests confirm that edge-case requests for empty strings do not
  // produce stray characters, guarding against unexpected allocations or
  // logic errors in consumers relying on explicit zero-length results.

  @Test
  // Ensures ASCII generator safely handles zero-length requests.
  func asciiZeroLengthReturnsEmpty() {
    #expect(Random.printableASCII(length: 0).isEmpty)
  }

  @Test
  // Verifies emoji generator returns nothing when length is zero.
  func emojiZeroLengthReturnsEmpty() {
    #expect(Random.emoji(length: 0).isEmpty)
  }

  @Test
  // Checks mixed mode respects zero-length requests across character sets.
  func mixedZeroLengthReturnsEmpty() {
    #expect(Random.mixed(length: 0).isEmpty)
  }

  // MARK: - noConfusing checks
  // Ambiguous characters are difficult to distinguish (e.g., `0` vs `O`).
  // These tests ensure the `noConfusing` flag filters them out for
  // readability and to reduce user input errors.

  private let ambiguous: Set<Character> = ["0", "O", "1", "l", "I"]

  @Test
  // ASCII generator should omit ambiguous characters when requested.
  func asciiNoConfusingOmitsAmbiguousCharacters() {
    let result = Random.printableASCII(length: 100, noConfusing: true)
    #expect(result.allSatisfy { !ambiguous.contains($0) })
  }

  @Test
  // Mixed generator also needs to exclude ambiguous characters.
  func mixedNoConfusingOmitsAmbiguousCharacters() {
    let result = Random.mixed(length: 100, noConfusing: true)
    #expect(result.allSatisfy { !ambiguous.contains($0) })
  }

  // MARK: - Length checks
  // Random outputs should always honor the requested length to avoid
  // producing strings that are too short or long, which could break
  // consumer assumptions such as password lengths.

  @Test
  // ASCII generator must return exactly the requested number of characters.
  func asciiHonorsRequestedLength() {
    let length = 64
    let result = Random.printableASCII(length: length)
    #expect(result.count == length)
  }

  @Test
  // Emoji generator should match its requested length as well.
  func emojiHonorsRequestedLength() {
    let length = 32
    let result = Random.emoji(length: length)
    #expect(result.count == length)
  }

  @Test
  // Mixed generator combines both character sets and must still respect length.
  func mixedHonorsRequestedLength() {
    let length = 48
    let result = Random.mixed(length: length)
    #expect(result.count == length)
  }

  // MARK: - Emoji restrictions
  // Generated emoji should mirror the restrictions used when building the
  // emoji table to avoid combining marks or variation selectors slipping in.

  @Test
  // Emoji output should consist solely of standalone emoji scalars.
  func emojiUsesStandaloneEmoji() {
    let result = Random.emoji(length: 128)
    let allStandalone = result.allSatisfy { ch in
      ch.unicodeScalars.count == 1 &&
        Random.isStandaloneEmoji(ch.unicodeScalars.first!)
    }
    #expect(allStandalone)
  }

  @Test
  // Mixed output should apply the same emoji restrictions for non-ASCII.
  func mixedEmojiUsesSameRestrictions() {
    let result = Random.mixed(length: 128)
    let allValid = result.allSatisfy { ch in
      let scalar = ch.unicodeScalars.first!
      if scalar.isASCII { return ch.unicodeScalars.count == 1 }
      return ch.unicodeScalars.count == 1 && Random.isStandaloneEmoji(scalar)
    }
    #expect(allValid)
  }
}

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

}

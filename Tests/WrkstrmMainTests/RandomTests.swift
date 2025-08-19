import Testing

@testable import WrkstrmMain

struct RandomTests {

  // MARK: - Zero-length checks

  @Test
  func asciiZeroLengthReturnsEmpty() {
    #expect(Random.printableASCII(length: 0).isEmpty)
  }

  @Test
  func emojiZeroLengthReturnsEmpty() {
    #expect(Random.emoji(length: 0).isEmpty)
  }

  @Test
  func mixedZeroLengthReturnsEmpty() {
    #expect(Random.mixed(length: 0).isEmpty)
  }

  // MARK: - noConfusing checks

  private let ambiguous: Set<Character> = ["0", "O", "1", "l", "I"]

  @Test
  func asciiNoConfusingOmitsAmbiguousCharacters() {
    let result = Random.printableASCII(length: 100, noConfusing: true)
    #expect(result.allSatisfy { !ambiguous.contains($0) })
  }

  @Test
  func mixedNoConfusingOmitsAmbiguousCharacters() {
    let result = Random.mixed(length: 100, noConfusing: true)
    #expect(result.allSatisfy { !ambiguous.contains($0) })
  }

  // MARK: - Length checks

  @Test
  func asciiHonorsRequestedLength() {
    let length = 64
    let result = Random.printableASCII(length: length)
    #expect(result.count == length)
  }

  @Test
  func emojiHonorsRequestedLength() {
    let length = 32
    let result = Random.emoji(length: length)
    #expect(result.count == length)
  }

  @Test
  func mixedHonorsRequestedLength() {
    let length = 48
    let result = Random.mixed(length: length)
    #expect(result.count == length)
  }
}


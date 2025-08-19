import Testing

@testable import WrkstrmMain

struct StringTests {

  @Test
  func testUnique() {
    #expect("ab".containsUniqueChars())
  }

  @Test
  func testRepeating() {
    #expect(!"aa".containsUniqueChars())
  }

  @Test
  func testEasyPermutation() {
    #expect(!"aa".isPermutation("aaa"))
  }

  @Test
  func testHarderPermutation() {
    #expect(!"ab".isPermutation("aa"))
  }

  @Test
  func testIsPermutation() {
    #expect("aa".isPermutation("aa"))
  }

  @Test
  func testPermutationFalsePositive() {
    #expect(!"ad".isPermutation("bc"))
  }

  @Test
  func testPermutationPositive() {
    #expect("ab".isPermutation("ba"))
  }

  @Test
  func testPermutationReorderedCharacters() {
    #expect("abc".isPermutation("cab"))
  }

  @Test
  func testPermutationRepeatingCharacters() {
    #expect("aab".isPermutation("aba"))
  }
}

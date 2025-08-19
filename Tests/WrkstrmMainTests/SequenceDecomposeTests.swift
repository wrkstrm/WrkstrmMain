import Testing

@testable import WrkstrmMain

/// Coverage for the sequence decomposition helpers. These utilities are core
/// building blocks in pipelines that pull apart or batch collections, so a
/// regression here could silently drop elements or mis-order data. The tests
/// below ensure each helper handles matches, non-matches and empty sequences
/// so that higher-level algorithms can rely on their behavior.
struct SequenceDecomposeTests {

  // MARK: - Decompose First
  // Pulls out the first element matching a predicate without disturbing the
  // order of remaining items.

  @Test
  func testDecomposeFirstWithMatch() {
    let (first, others) = [1, 2, 3].decomposeFirst { $0 == 2 }
    #expect(first == 2)
    #expect(others == [1, 3])
  }

  @Test
  func testDecomposeFirstWithNoMatch() {
    let (first, others) = [1, 2, 3].decomposeFirst { $0 == 4 }
    #expect(first == nil)
    #expect(others == [1, 2, 3])
  }

  @Test
  func testDecomposeFirstEmptySequence() {
    let (first, others) = [Int]().decomposeFirst { _ in true }
    #expect(first == nil)
    #expect(others.isEmpty)
  }

  // MARK: - Decompose
  // Splits a sequence into its head and tail, serving as the baseline for
  // more complex decomposition operations.

  @Test
  func testDecompose() {
    let (first, others) = [1, 2, 3].decompose()
    #expect(first == 1)
    #expect(others == [2, 3])
  }

  @Test
  func testDecomposeEmptySequence() {
    let (first, others) = [Int]().decompose()
    #expect(first == nil)
    #expect(others.isEmpty)
  }

  // MARK: - Decompose All
  // Separates all elements matching a predicate while preserving the rest,
  // mirroring a partition operation.

  @Test
  func testDecomposeAllWithMatches() {
    let (all, others) = [1, 2, 3, 4].decomposeAll { $0 % 2 == 0 }
    #expect(all == [2, 4])
    #expect(others == [1, 3])
  }

  @Test
  func testDecomposeAllWithNoMatches() {
    let (all, others) = [1, 3, 5].decomposeAll { $0 % 2 == 0 }
    #expect(all == nil)
    #expect(others == [1, 3, 5])
  }

  @Test
  func testDecomposeAllEmptySequence() {
    let (all, others) = [Int]().decomposeAll { _ in true }
    #expect(all == nil)
    #expect(others.isEmpty)
  }

  // MARK: - Decompose Until
  // Accumulates elements until the predicate fails, enabling controlled
  // consumption of prefixes from a sequence.

  @Test
  func testDecomposeUntilWithMatches() {
    let (all, others) = [1, 2, 3, 2, 1].decomposeUntil { $0 < 3 }
    #expect(all == [1, 2])
    #expect(others == [3, 2, 1])
  }

  @Test
  func testDecomposeUntilWithNoMatches() {
    let (all, others) = [3, 4, 5].decomposeUntil { $0 < 3 }
    #expect(all == nil)
    #expect(others == [3, 4, 5])
  }

  @Test
  func testDecomposeUntilEmptySequence() {
    let (all, others) = [Int]().decomposeUntil { _ in true }
    #expect(all == nil)
    #expect(others.isEmpty)
  }

  // MARK: - Contain
  // Predicate-based containment checks are often used before performing bulk
  // operations; correctness here prevents misclassification.

  @Test
  func testAllMatch() {
    // Ensures `allMatch` correctly detects when every element satisfies a
    // predicate and fails fast otherwise.
    #expect([1, 2, 3].allMatch { _ in true })
    #expect(![1, 2, 3].allMatch { _ in false })
  }

  @Test
  func testNoneMatch() {
    // Ensures `noneMatch` correctly detects when no elements satisfy a
    // predicate and flips when any do.
    #expect([1, 2, 3].noneMatch { _ in false })
    #expect(![1, 2, 3].noneMatch { _ in true })
  }

  // MARK: - Split
  // Splits a sequence into fixed-size batches, which is critical for chunked
  // processing tasks like pagination or network requests.

  @Test
  func testSplitBatchSizeTrailing() {
    // Verifies that trailing batches are emitted when the total count is not a
    // multiple of the batch size so no elements are lost.
    let batches = Array(1...10).split(batchSize: 3)
    #expect(batches.count == 4)
    #expect(batches.last?.count == 1)
  }

  @Test
  func testSplitBatchSizeExact() {
    // When the total count divides evenly, each batch should have the full
    // requested size.
    let batches = Array(1...9).split(batchSize: 3)
    #expect(batches.count == 3)
    #expect(batches.last?.count == 3)
  }
}

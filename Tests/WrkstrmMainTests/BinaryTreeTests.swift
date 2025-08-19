import Testing

@testable import WrkstrmMain

struct BinaryTreeTests {
  var tree: BinaryTree = .init(1)

  /// Verifies count updates after sequential inserts, catching regressions in basic insertion logic.
  @Test
  func basicInsertion() {
    tree.insert(3)
    tree.insert(5)
    tree.insert(7)
    tree.insert(1)
    tree.insert(0)
    tree.insert(20)
    tree.insert(11)  // Count == 8
    #expect(tree.count == 8)
  }

  /// Ensures count remains accurate for a variety of insertion patterns.
  @Test
  func randomTreeCount() {
    let randomTree: BinaryTree = .init(1)
    let randomCount = Int.random(in: 0...10)
    for _ in 0..<randomCount {
      randomTree.insert(Int.random(in: 0...10))
    }
    #expect(randomTree.count == (randomCount + 1))
  }

  /// Confirms duplicate values are consistently routed to the right and counted.
  @Test
  func duplicateInsertion() {
    let root = BinaryTree(5)
    let first = root.insert(5)
    let second = first.insert(5)
    #expect(root.count == 3)
    #expect(root.left == nil)
    #expect(root.right === first)
    #expect(first.right === second)
    #expect(first.parent === root)
    #expect(second.parent === first)
  }

  /// Validates that traversal honors pre-, in-, and post-order sequences after recursion bug fix.
  @Test
  func traversalOrders() {
    let root = BinaryTree(4)
    root.insert(2)
    root.insert(6)
    root.insert(1)
    root.insert(3)
    root.insert(5)
    root.insert(7)

    var pre: [Int] = []
    root.traverse(.pre) { pre.append($0.value) }
    #expect(pre == [4, 2, 1, 3, 6, 5, 7])

    var inorder: [Int] = []
    root.traverse(.in) { inorder.append($0.value) }
    #expect(inorder == [1, 2, 3, 4, 5, 6, 7])

    var post: [Int] = []
    root.traverse(.post) { post.append($0.value) }
    #expect(post == [1, 3, 2, 5, 7, 6, 4])
  }

  /// Checks `isRoot`, `isLeaf`, and `parent` links to prevent reference errors.
  @Test
  func nodeRelationships() {
    let root = BinaryTree(10)
    #expect(root.isRoot)
    #expect(root.isLeaf)
    #expect(root.parent == nil)

    let left = root.insert(5)
    let right = root.insert(15)
    #expect(!root.isLeaf)
    #expect(!left.isRoot)
    #expect(left.isLeaf)
    #expect(right.isLeaf)
    #expect(left.parent === root)
    #expect(right.parent === root)

    let leftChild = left.insert(3)
    #expect(!left.isLeaf)
    #expect(leftChild.isLeaf)
    #expect(leftChild.parent === left)
  }
}

import Testing

@testable import WrkstrmMain

struct BinaryTreeTests {
  var tree: BinaryTree = .init(1)

  @Test func basicInsertion() {
    tree.insert(3)
    tree.insert(5)
    tree.insert(7)
    tree.insert(1)
    tree.insert(0)
    tree.insert(20)
    tree.insert(11)  // Count == 8
    #expect(tree.count == 8)
  }

  @Test func randomTreeCount() {
    let randomTree: BinaryTree = .init(1)
    let randomCount = Int.random(in: 0...10)
    for _ in 0..<randomCount {
      randomTree.insert(Int.random(in: 0...10))
    }
    #expect(randomTree.count == (randomCount + 1))
  }
}

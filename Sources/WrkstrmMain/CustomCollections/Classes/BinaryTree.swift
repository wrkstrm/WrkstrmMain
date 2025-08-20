/// A binary tree data structure that stores values of a generic type.
///
/// A binary tree is a tree data structure in which each node has at most two children, referred to
/// as the left and right child.
public class BinaryTree<Value: Comparable> {
  /// The order in which to traverse the binary tree when calling `traverse(block:)` method.
  public enum Order {
    /// Pre-order traversal: Visit the current node before its children.
    case pre

    /// In-order traversal: Visit the left child, then the current node, and finally the right
    /// child.
    case `in`

    /// Post-order traversal: Visit the children first, and then the current node.
    case post
  }

  /// The value stored in this binary tree node.
  public private(set) var value: Value

  /// The parent node of this binary tree node.
  public private(set) var parent: BinaryTree?

  /// The left child node of this binary tree node.
  public private(set) var left: BinaryTree?

  /// The right child node of this binary tree node.
  public private(set) var right: BinaryTree?

  /// Returns `true` if this binary tree node is the root node.
  public var isRoot: Bool { parent == nil }

  /// Returns `true` if this binary tree node is a leaf node (has no children).
  public var isLeaf: Bool { left == nil && right == nil }

  /// Returns `true` if this binary tree node has a left child.
  public var hasLeftChild: Bool { left != nil }

  /// Returns `true` if this binary tree node has a right child.
  public var hasRightChild: Bool { right != nil }

  /// Returns the total count of nodes in the binary tree rooted at this node.
  public var count: Int { (left?.count ?? 0) + 1 + (right?.count ?? 0) }

  /// Creates a binary tree node with the given value.
  /// - Parameter value: The value to be stored in this binary tree node.
  public init(_ value: Value) {
    self.value = value
  }

  private init(_ value: Value, parent: BinaryTree?) {
    self.value = value
    self.parent = parent
  }

  /// Inserts a new value into the binary tree while maintaining the binary search tree property.
  /// - Parameter value: The value to insert into the binary tree.
  /// - Returns: The binary tree node where the value was inserted.
  @discardableResult
  public func insert(_ value: Value) -> BinaryTree {
    guard value < self.value else {
      guard let right else {
        let newNode = BinaryTree(value, parent: self)
        right = newNode
        return newNode
      }
      return right.insert(value)
    }
    guard let left else {
      let newNode = BinaryTree(value, parent: self)
      left = newNode
      return newNode
    }
    return left.insert(value)
  }

  /// Traverses the binary tree in the specified order and performs a given action on each node.
  /// - Parameters:
  ///   - order: The order in which to traverse the binary tree. Default is `.in`.
  ///   - block: The action to perform on each node.
  public func traverse(_ order: Order = .in, block: (BinaryTree) -> Void) {
    switch order {
    case .pre:
      block(self)
      left?.traverse(order, block: block)
      right?.traverse(order, block: block)

    case .in:
      left?.traverse(order, block: block)
      block(self)
      right?.traverse(order, block: block)

    case .post:
      left?.traverse(order, block: block)
      right?.traverse(order, block: block)
      block(self)
    }
  }
}

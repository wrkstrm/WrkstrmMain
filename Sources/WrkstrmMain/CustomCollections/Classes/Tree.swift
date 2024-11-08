/// A generic tree data structure.
///
/// You can create a tree with a specific type of value by providing the type as a generic parameter
/// `T`.
public class Tree<T>: CustomDebugStringConvertible {
  /// The value contained in this node.
  public let value: T

  /// The children nodes of this tree node.
  public var children: [Tree] = []

  /// A weak reference to the parent node of this tree node.
  public weak var parent: Tree?

  /// A textual representation of this tree node, which is based on the value it contains.
  public var debugDescription: String { String(describing: value) }

  /// Initializes a new tree node with the given value.
  /// - Parameter value: The value to be stored in this tree node.
  public init(_ value: T) {
    self.value = value
  }

  /// Adds a child node to this tree node.
  /// - Parameter child: The child tree node to add.
  public func add(_ child: Tree) {
    children.append(child)
    child.parent = self
  }
}

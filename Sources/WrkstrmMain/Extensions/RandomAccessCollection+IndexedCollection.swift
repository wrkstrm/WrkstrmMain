/// An extension for `RandomAccessCollection`.
/// This extension provides a method to convert any random access collection into an indexed
/// collection.
extension RandomAccessCollection {
  /// Wraps the collection into an `IndexedCollection`.
  ///
  /// This method provides indexed access to the elements of the collection. `IndexedCollection` is
  /// a structure that pairs each element of the collection with its index, offering a convenient
  /// way to enumerate a collection with index-aware operations.
  ///
  /// - Returns: An `IndexedCollection` instance that wraps the original collection, pairing its
  /// elements with their respective indices.
  func indexed() -> IndexedCollection<Self> {
    IndexedCollection(base: self)
  }
}

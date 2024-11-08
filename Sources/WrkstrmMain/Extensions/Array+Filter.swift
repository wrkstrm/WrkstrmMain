/// An extension on `Array` providing additional functionalities for elements that conform to
/// `Equatable`.
extension Array where Element: Equatable {
  /// Returns a new array by removing elements that are present in another array.
  ///
  /// This method filters out elements from the original array that are found in `otherArray`.
  /// It's useful for creating a new array with certain elements excluded, especially when working
  /// with collections of `Equatable` elements.
  ///
  /// - Parameter otherArray: An array containing elements to be removed from the original array.
  /// - Returns: A new array with elements from the original array that are not found in
  /// `otherArray`.
  public func removing(objectsIn otherArray: [Element]) -> [Element] {
    filter { !otherArray.contains($0) }
  }
}

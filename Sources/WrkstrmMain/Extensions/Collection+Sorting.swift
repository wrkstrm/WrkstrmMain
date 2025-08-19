/// An extension for Collections where elements are Comparable and indexed by Int.
/// This extension provides methods for binary search and merge sort.
extension Collection where Element: Comparable, Index == Int {
  // MARK: - Binary Search

  /// Performs a binary search for a given key in the collection.
  ///
  /// This method splits the collection into halves to find the key, reducing the search area in
  /// each step. It returns the index of the key if found, or `nil` if the key is not present.
  ///
  /// - Parameter key: The element to search for within the collection.
  /// - Returns: The index of the element if it's found, otherwise `nil`.
  public func search(key: Element) -> Int? {
    var lowerBound = startIndex
    var upperBound = endIndex

    while lowerBound < upperBound {
      let mid = index(lowerBound, offsetBy: (upperBound - lowerBound) / 2)
      if self[mid] == key {
        return mid
      } else if self[mid] < key {
        lowerBound = mid + 1
      } else {
        upperBound = mid
      }
    }
    return nil
  }

  // MARK: - Merge Sort

  /// Performs a merge sort on the collection.
  ///
  /// Merge sort is a divide-and-conquer algorithm that splits the collection into smaller parts,
  /// sorts them, and then merges them back together.
  /// This method returns a new array containing the sorted elements.
  ///
  /// - Returns: A new array with the elements of the collection sorted.
  public func mergeSort() -> [Element] {
    guard count > 1 else { return Array(self) }

    let midIndex = startIndex + (endIndex - startIndex) / 2
    let left = self[startIndex..<midIndex].mergeSort()
    let right = self[midIndex..<endIndex].mergeSort()

    return merge(left: left, right: right)
  }

  /// A helper method for merge sort that merges two sorted subarrays into a single sorted array.
  ///
  /// This private method takes two sorted subarrays and merges them in sorted order.
  /// It's used internally by the `mergeSort` method.
  ///
  /// - Parameters:
  ///   - left: The left subarray.
  ///   - right: The right subarray.
  /// - Returns: A new sorted array combining elements from the left and right subarrays.
  private func merge<T: Comparable>(left: [T], right: [T]) -> [T] {
    var mergedArray: ArraySlice<T> = .init()

    var left: ArraySlice = .init(left)
    var right: ArraySlice = .init(right)

    while let leftFirst = left.first, let rightFirst = right.first {
      if leftFirst < rightFirst {
        mergedArray.append(left.removeFirst())
      } else {
        mergedArray.append(right.removeFirst())
      }
    }
    return Array(mergedArray + left + right)
  }
}

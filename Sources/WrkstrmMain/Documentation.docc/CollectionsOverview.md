# Collections Overview

WrkstrmMain includes a few lightweight, reusable collection types for day‑to‑day algorithms.

## SortedArray

`SortedArray<Element>` maintains elements in order and supports efficient insertion.

```swift
import WrkstrmMain

var numbers = SortedArray(unsorted: [3, 1, 2])  // sorted: [1, 2, 3]
numbers.insert(5)  // [1, 2, 3, 5]
numbers.insert(0)  // [0, 1, 2, 3, 5]
```

## BinaryTree

Simple binary search tree with insert and traversal helpers.

```swift
import WrkstrmMain

let tree = BinaryTree(5)
tree.insert(3)
tree.insert(7)
// Inspect/debug via `debugDescription`
print(tree)
```

## IndexedCollection

Wrap any `Collection` to yield (index, element) pairs — a type‑safe alternative to `.enumerated()`.

```swift
import WrkstrmMain

for (i, value) in ["a", "b"].indexed() {
  print(i, value)
}
```

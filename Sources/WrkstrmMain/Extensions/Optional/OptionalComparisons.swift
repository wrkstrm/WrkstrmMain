/// Provides comparison functionality for optional values without declaring a retroactive
/// conformance to `Comparable`.
///
/// The comparison rules are:
/// - If both values are non-nil, compare the wrapped values.
/// - `nil` is considered less than any non-nil value.
public func < <Wrapped: Comparable>(lhs: Wrapped?, rhs: Wrapped?) -> Bool {
  switch (lhs, rhs) {
  case (.some(let l), .some(let r)):
    return l < r
  case (nil, .some):
    return true
  default:
    return false
  }
}

/// Returns true if the left optional value is greater than the right optional value.
/// This is defined in terms of the '<' operator above.
public func > <Wrapped: Comparable>(lhs: Wrapped?, rhs: Wrapped?) -> Bool {
  rhs < lhs
}

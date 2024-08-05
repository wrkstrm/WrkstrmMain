extension Sequence where Iterator.Element: Hashable {
  func unique() -> [Iterator.Element] {
    Array(reduce(into: Set<Iterator.Element>()) { $0.insert($1) })
  }
}

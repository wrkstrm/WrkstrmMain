extension Array where Element: Equatable {
  public func removing(objectsIn otherArray: [Element]) -> [Element] {
    filter { !otherArray.contains($0) }
  }
}

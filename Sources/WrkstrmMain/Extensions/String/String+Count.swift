extension String {
  public func count(of occurrence: String) -> Int {
    var indices: [Int] = []
    var position = startIndex
    while let range = range(of: occurrence, range: position..<endIndex) {
      let i = distance(from: startIndex, to: range.lowerBound)
      indices.append(i)
      let offset = occurrence.distance(from: occurrence.startIndex, to: occurrence.endIndex) - 1
      guard let after = index(range.lowerBound, offsetBy: offset, limitedBy: endIndex) else {
        break
      }
      position = index(after: after)
    }
    return indices.count
  }
}

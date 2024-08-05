extension String {
  enum ReplaceResult {
    case failedToLoad(_ path: String)
    case excluded
    case searchTermNotFound
    case failedToWrite(_ path: String)
    case edited(_ string: String)
  }

  @discardableResult static func replace(filePath: String, step: Step) -> ReplaceResult {
    guard let originalSource = try? String(contentsOfFile: filePath) else {
      return .failedToLoad(filePath)
    }
    let containsExclussionTerm =
      step.exclusionTerms?.reduce(
        into: Bool(false)
      ) { reducedResult, term in
        if originalSource.contains(term) {
          reducedResult = true
        }
      } ?? false
    var editedSource = originalSource
    if containsExclussionTerm {
      Log.main.info("File not changed due to exclution terms")
      return .excluded
    }
    for searchTerm in step.searchTerms! where originalSource.contains(searchTerm) {
      editedSource = editedSource.replacingOccurrences(
        of: searchTerm, with: step.replaceTerm!, options: .literal
      )
    }
    guard editedSource != originalSource else {
      return .searchTermNotFound
    }
    do {
      try editedSource.write(toFile: filePath, atomically: true, encoding: .utf8)
      return .edited(editedSource)
    } catch {
      return .failedToWrite(filePath)
    }
  }
}

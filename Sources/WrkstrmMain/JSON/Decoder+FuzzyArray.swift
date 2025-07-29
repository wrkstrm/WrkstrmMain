extension Decoder {
  /// Decodes a value that may be:
  /// - `null`
  /// - a single object (e.g., `{ ... }`)
  /// - or an array of objects (e.g., `[ { ... }, { ... } ]`)
  ///
  /// It returns a normalized optional array of the decoded type.
  ///
  /// This is useful for decoding inconsistent JSON formats like those found in
  /// Notion, Firebase, or lenient APIs where the schema may vary per document.
  ///
  /// - Returns: `nil` if the value is null, a single-element array if the value is a single object,
  ///            or an array if the value is an array.
  /// - Throws: `DecodingError` if the value is malformed or doesn't conform to the expected type.
  public func decodeArrayAllowingNullOrSingle<T: Decodable>(
    of type: T.Type = T.self
  ) throws -> [T]? {
    let container = try self.singleValueContainer()

    if container.decodeNil() {
      return nil
    }

    if let single = try? container.decode(T.self) {
      return [single]
    }

    if let array = try? container.decode([T].self) {
      return array
    }

    throw DecodingError.dataCorruptedError(
      in: container,
      debugDescription:
        "Expected null, single object, or array of type \(T.self)"
    )
  }
}

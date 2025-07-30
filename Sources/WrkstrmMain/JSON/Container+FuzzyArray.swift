extension KeyedDecodingContainer {
  /// Decodes a value for `key` that may be null, a single object,
  /// or an array of objects, returning a normalized optional array.
  ///
  /// - parameter type: The element type to decode.
  /// - parameter key: The CodingKey to decode from.
  /// - returns: `nil` if value is null, single-element `[T]` if a single T,
  ///            or `[T]` if an array.
  /// - throws: `DecodingError.dataCorruptedError` if object shape is unrecognized.
  public func decodeArrayAllowingNullOrSingle<T>(
    _ type: T.Type = T.self,
    forKey key: Key
  ) throws -> [T]? where T: Decodable {
    guard contains(key) else {
      throw DecodingError.dataCorruptedError(
        forKey: key,
        in: self,
        debugDescription:
          "Key not found in container. Key: \(key.stringValue) Type: (\(T.self))"
      )
    }
    if try decodeNil(forKey: key) {
      return nil
    }
    do {
      // Try decoding as array
      return try decode([T].self, forKey: key)
    } catch {
      // Try decoding as single value
      if let single = try? decodeObjectAllowingNullOrEmptyObject(T.self, forKey: key) {
        return [single]
      }
      return nil
    }
  }

  public func decodeObjectAllowingNullOrEmptyObject<T>(
    _ type: T.Type = T.self,
    forKey key: Key
  ) throws -> T? where T: Decodable {
    if try decodeNil(forKey: key) {
      return nil
    }

    do {
      // Try decoding as an obect
      return try decode(T.self, forKey: key)
    } catch let potentialEmptyObjectError {
      print("Expected null or empty object, or type (\(T.self)) for key \(key.stringValue)")
      print("Ignoring Potential Empty object error. Confirm: \(potentialEmptyObjectError)")
      // Try decoding as single value
      return nil
    }
  }
}

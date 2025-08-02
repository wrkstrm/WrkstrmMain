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
      if let single = try? decodeAllowingNullOrEmptyObject(T.self, forKey: key) {
        return [single]
      }
      throw "Could not decode."
    }
  }

  /// Decodes a value for `key` that may be null, an empty object, or a fully-formed object, returning an optional.
  ///
  /// - parameter type: The type to decode.
  /// - parameter key: The CodingKey to decode from.
  /// - returns: `nil` if value is null or an empty object, or the decoded value of type `T`.
  /// - throws: If decoding fails or the value is not of the expected shape/type.
  public func decodeAllowingNullOrEmptyObject<T>(
    _ type: T.Type = T.self,
    forKey key: Key
  ) throws -> T? where T: Decodable {
    if try decodeNil(forKey: key) {
      return nil
    }
    
    if let _ = try? decode(JSON.EmptyCodableStruct.self, forKey: key) {
      return nil
    }

    // Try decoding as an obect
    return try decode(T.self, forKey: key)
  }
}

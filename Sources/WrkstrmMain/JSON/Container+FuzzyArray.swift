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
    if try decodeNil(forKey: key) {
      return nil
    }
    // If object, check if it's empty {}
    if let nested = try? nestedContainer(
      keyedBy: AnyCodingKey.self,
      forKey: key
    ),
      nested.allKeys.isEmpty
    {
      return nil
    }

    // Try unkeyed container (an actual array)
    if var unkeyed = try? nestedUnkeyedContainer(forKey: key) {
      var result: [T] = []
      while !unkeyed.isAtEnd {
        result.append(try unkeyed.decode(T.self))
      }
      return result
    }

    // Try single value container (a single object)
    if let single = try? decode(T.self, forKey: key) {
      return [single]
    }

    throw DecodingError.dataCorruptedError(
      forKey: key,
      in: self,
      debugDescription:
        "Expected null, single object, or array for key \(key.stringValue)"
    )
  }
  
  public func decodeAllowingNullOrEmptyObject<T>(
    _ type: T.Type = T.self,
    forKey key: Key
  ) throws -> T? where T: Decodable {
    if try decodeNil(forKey: key) {
      return nil
    }
    // If object, check if it's empty {}
    if let nested = try? nestedContainer(
      keyedBy: AnyCodingKey.self,
      forKey: key
    ),
      nested.allKeys.isEmpty
    {
      return nil
    }

    // Try single value container (a single object)
    if let single = try? decodeIfPresent(T.self, forKey: key) {
      return single
    }

    throw DecodingError.dataCorruptedError(
      forKey: key,
      in: self,
      debugDescription:
        "Expected null, single object, or type (\(T.self)) for key \(key.stringValue)"
    )
  }
}

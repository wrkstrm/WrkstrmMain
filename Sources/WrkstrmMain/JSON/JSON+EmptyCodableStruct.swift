// Helper type for detecting empty JSON objects.

extension JSON {
  /// Empty `Codable` used to validate `{}` objects when decoding.
  /// Decoding succeeds only if the underlying object has no keys.
  struct EmptyCodableStruct: Codable {
    init() {}

    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: AnyCodingKey.self)
      guard container.allKeys.isEmpty else {
        throw DecodingError.dataCorrupted(
          .init(codingPath: decoder.codingPath, debugDescription: "Expected empty object")
        )
      }
    }

    func encode(to encoder: Encoder) throws {
      _ = encoder.container(keyedBy: AnyCodingKey.self)
    }
  }
}

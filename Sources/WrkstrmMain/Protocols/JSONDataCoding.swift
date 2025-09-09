import Foundation

// Protocols for pluggable JSON encoders/decoders.
// Implementations may live in higher-level modules.

public protocol JSONDataEncoding: Sendable {
  func encode<T: Encodable>(_ value: T) throws -> Data
}

public protocol JSONDataDecoding: Sendable {
  func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

public typealias JSONDataCoding = JSONDataEncoding & JSONDataDecoding

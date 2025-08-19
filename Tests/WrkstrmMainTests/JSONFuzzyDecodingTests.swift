import Foundation
import Testing

@testable import WrkstrmMain

private struct Item: Codable, Equatable {
  let name: String
}

private struct ArrayWrapper: Decodable {
  let items: [Item]?

  enum CodingKeys: String, CodingKey { case items }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    items = try container.decodeArrayAllowingNullOrSingle(Item.self, forKey: .items)
  }
}

private struct ObjectWrapper: Decodable {
  let item: Item?

  enum CodingKeys: String, CodingKey { case item }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    item = try container.decodeAllowingNullOrEmptyObject(Item.self, forKey: .item)
  }
}

struct JSONFuzzyDecodingTests {
  // MARK: - decodeArrayAllowingNullOrSingle

  @Test
  func decodeArrayWithNull() throws {
    let json = #"{"items": null}"#.data(using: .utf8)!
    let result = try JSONDecoder().decode(ArrayWrapper.self, from: json)
    #expect(result.items == nil)
  }

  @Test
  func decodeArrayWithSingleObject() throws {
    let json = #"{"items": {"name": "A"}}"#.data(using: .utf8)!
    let result = try JSONDecoder().decode(ArrayWrapper.self, from: json)
    #expect(result.items == [Item(name: "A")])
  }

  @Test
  func decodeArrayWithArray() throws {
    let json = #"{"items": [{"name": "A"}, {"name": "B"}]}"#.data(using: .utf8)!
    let result = try JSONDecoder().decode(ArrayWrapper.self, from: json)
    #expect(result.items == [Item(name: "A"), Item(name: "B")])
  }

  @Test
  func decodeArrayWithMalformedValue() throws {
    let json = #"{"items": 1}"#.data(using: .utf8)!
    #expect(throws: DecodingError.self) {
      try JSONDecoder().decode(ArrayWrapper.self, from: json)
    }
  }

  // MARK: - decodeAllowingNullOrEmptyObject

  @Test
  func decodeObjectWithNull() throws {
    let json = #"{"item": null}"#.data(using: .utf8)!
    let result = try JSONDecoder().decode(ObjectWrapper.self, from: json)
    #expect(result.item == nil)
  }

  @Test
  func decodeObjectWithEmptyObject() throws {
    let json = #"{"item": {}}"#.data(using: .utf8)!
    let result = try JSONDecoder().decode(ObjectWrapper.self, from: json)
    #expect(result.item == nil)
  }

  @Test
  func decodeObjectWithSingleObject() throws {
    let json = #"{"item": {"name": "A"}}"#.data(using: .utf8)!
    let result = try JSONDecoder().decode(ObjectWrapper.self, from: json)
    #expect(result.item == Item(name: "A"))
  }

  @Test
  func decodeObjectWithMalformedValue() throws {
    let json = #"{"item": 1}"#.data(using: .utf8)!
    #expect(throws: DecodingError.self) {
      try JSONDecoder().decode(ObjectWrapper.self, from: json)
    }
  }
}


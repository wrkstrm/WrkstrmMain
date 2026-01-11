# JSON Fuzzy Decoding

WrkstrmMain includes decoding helpers that tolerate real‑world API quirks while still surfacing
truly malformed data.

## Topics

### Handling Inconsistent Objects

- ``Swift/KeyedDecodingContainer/decodeAllowingNullOrEmptyObject(_:forKey:)``

### Handling Arrays or Single Objects

- ``Swift/KeyedDecodingContainer/decodeArrayAllowingNullOrSingle(_:forKey:)``

## Overview

Many services signal “no data” with odd shapes such as `null`, the string "null", or an empty object
`{}`. Likewise, array fields sometimes return a single object. The helpers above normalize those
variants to `nil` or a single‑element array so model decoding doesn't fail.

Unexpected shapes—like numbers or arrays where an object is required—still throw so server bugs
aren't silently ignored.

## Example

```swift
struct Wrapper: Decodable {
  let item: Item?
  let items: [Item]?

  enum CodingKeys: String, CodingKey { case item, items }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    item = try container.decodeAllowingNullOrEmptyObject(Item.self, forKey: .item)
    items = try container.decodeArrayAllowingNullOrSingle(Item.self, forKey: .items)
  }
}
```

@Metadata {
  @Title("Protocols Overview")
  @PageKind(article)
}

WrkstrmMain defines a small set of protocols intended to stay portable and easy to adapt.

## JSONDataEncoding / JSONDataDecoding

Protocols for pluggable JSON encoding/decoding. Higher layers (e.g., WrkstrmFoundation) can supply
Foundation‑backed defaults, while projects can inject custom implementations.

```swift
import Foundation
import WrkstrmMain

struct EncoderBox: JSONDataEncoding {
  let base: JSONEncoder
  func encode<T: Encodable>(_ value: T) throws -> Data { try base.encode(value) }
}

struct DecoderBox: JSONDataDecoding {
  let base: JSONDecoder
  func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T { try base.decode(T.self, from: data) }
}
```

Combine them to build a `JSON.Parser`:

```swift
let parser = JSON.Parser(encoder: EncoderBox(base: .init()), decoder: DecoderBox(base: .init()))
```

## Injectable

Small protocol for manual dependency injection.

```swift
import WrkstrmMain

final class Dashboard: Injectable {
  struct Resource { let parser: JSON.Parser }
  private var resource: Resource?

  func inject(_ resource: Resource) { self.resource = resource }
  func assertDependencies() { precondition(resource != nil, "Missing parser") }
}
```


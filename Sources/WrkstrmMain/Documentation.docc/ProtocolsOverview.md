# Protocols Overview

WrkstrmMain defines a small set of protocols intended to stay portable and easy to adapt.

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

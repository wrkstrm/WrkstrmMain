# `Injectable`

A protocol for injecting external resources into a type and verifying that dependencies are
configured.

## Topics

### Managing Dependencies

- ``WrkstrmMain/Injectable/Resource``
- ``WrkstrmMain/Injectable/inject(_:)``
- ``WrkstrmMain/Injectable/assertDependencies()``

## Overview

`Injectable` decouples collaborators by allowing dependencies to be supplied from the outside.
Conforming types declare an associated `Resource` to represent the dependency. Use `inject(_:)` to
store the resource and `assertDependencies()` to ensure everything is wired correctly.

## Example

```swift
struct NetworkService {
  func request(_ path: String) { /* ... */  }
}

final class UserViewModel: Injectable {
  typealias Resource = NetworkService
  private var service: NetworkService?

  func inject(_ resource: NetworkService) {
    service = resource
  }

  func assertDependencies() {
    precondition(service != nil, "NetworkService must be injected")
  }
}
```

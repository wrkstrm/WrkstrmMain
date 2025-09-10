// JSON key-value representation with conditional Date support.

#if canImport(Foundation)
import Foundation
#endif

extension JSON {
  /// Represents various JSON value types associated with a string key.
  public enum KVPair: Equatable {
    case integer(String, Int)
    case double(String, Double)
    case string(String, String)

    #if canImport(Foundation)
    case date(String, Date)
    #else
    case date(String, String)
    #endif

    case array(String, JSON.AnyEquatableArrayEnum)
    case dictionary(String, JSON.AnyEquatableDictionaryEnum)
    case any(String, String)
  }
}

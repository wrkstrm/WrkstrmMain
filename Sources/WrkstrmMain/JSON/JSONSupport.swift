public enum JSON { }

extension JSON {
  public typealias AnyDictionary = [String: Any]

  public struct AnyEquatableStruct: Any, Equatable {}

  public typealias AnyEquatableDictionary = [String: AnyEquatableStruct]
}

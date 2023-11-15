public enum JSON { }

extension JSON {
  public typealias Dictionary = [String: Any]

  public struct AnyEquatableStruct: Any, Equatable {}

  public typealias AnyEquatableDictionary = [String: AnyEquatableStruct]
}

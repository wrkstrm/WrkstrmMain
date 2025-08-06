/// A generic struct that aids in sorting.
public struct Sort<Type> {
  // MARK: - Typealias

  /// A sort comparator function signature alias.
  public typealias Comparator = (Type, Type) -> Bool

  /// A property signature alias.
  public typealias Property<P: Comparable> = (Type) -> P

  // MARK: - Initializers

  /// A convenience initializer for an ascending sort struct. (A, B, C...)
  public static func ascending(_ ascending: @escaping Property<some Comparable>) -> Sort<Type> {
    Self(ascending: ascending)
  }

  /// A convenience initializer for a descending sort struct. (...3, 2, 1)
  public static func descending(_ descending: @escaping Property<some Comparable>) -> Sort<Type> {
    Self(descending: descending)
  }

  // MARK: - Comparator Generators

  /// A convenience comparator creator given a comparable property.
  public static func by(
    ascending: Bool = true,
    _ property: @escaping Property<some Comparable>,
  )
    -> Comparator
  {
    guard ascending else {
      return { property($0) > property($1) }
    }
    return { property($0) < property($1) }
  }

  /// A convenience comparator combinator given an array of simple comparators.
  @_specialize(where Type:_NativeClass)
  public static func by(_ comparators: [Comparator]) -> Comparator {
    {
      for comparator in comparators {
        if comparator($0, $1) { return true }
        if comparator($1, $0) { return false }
      }
      return false
    }
  }

  /// A sort struct combinator. Takes in a sequence of Sort structs and returns one comparator
  /// function.
  @_specialize(where Type:_NativeClass)
  public static func by(_ comparators: Sort<Type>...) -> Comparator {
    {
      for order in comparators {
        if order.comparator($0, $1) { return true }
        if order.comparator($1, $0) { return false }
      }
      return false
    }
  }

  /// A sort struct combinator. Takes in an array of Sort structs and returns one comparator
  /// function.
  @_specialize(where Type:_NativeClass)
  public static func by(_ comparators: [Sort<Type>]) -> Comparator {
    {
      for order in comparators {
        if order.comparator($0, $1) { return true }
        if order.comparator($1, $0) { return false }
      }
      return false
    }
  }

  let comparator: Comparator

  /// A convenience initializer for an ascending sort struct.
  public init(ascending: @escaping Property<some Comparable>) {
    comparator = { ascending($0) < ascending($1) }
  }

  /// A convenience initializer for a descending sort struct.
  public init(descending: @escaping Property<some Comparable>) {
    comparator = { descending($0) > descending($1) }
  }
}

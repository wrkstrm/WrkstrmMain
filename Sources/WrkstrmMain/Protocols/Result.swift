/// A value that represents either a success or a failure, including an associated value in each
/// case.
///
/// This enum is used for operations that can result in either a successful outcome or an error.
/// It encapsulates a successful outcome with its associated value or a failure with an error.
public enum Result<Model> {
  /// A failure, storing an `Error`.
  ///
  /// Use this case to represent a failure in an operation and to store the associated error.
  /// - Parameter Error: The error associated with the failure of the operation.
  case failure(Error)

  /// A success, storing a `Model` value.
  ///
  /// Use this case to represent a successful outcome of an operation and to store the result value.
  /// - Parameter Model: The type of the value associated with a successful outcome.
  case success(Model)
}

extension CommandLine {
  /// An array of substrings derived from splitting the first command-line argument by the "/"
  /// separator.
  /// This representation is useful for extracting the executable name and path.
  internal static let splitArguments: [String.SubSequence] = arguments[0].split(separator: "/")

  /// Returns the executable name of the current process.
  ///
  /// The executable name is determined by splitting the first command-line argument by "/"
  /// and taking the last component of the result.
  /// It's assumed that the first argument (`arguments[0]`) is the path to the executable.
  ///
  /// - Returns: A `String` representing the name of the executable. If no
  ///   argument is present, an empty string is returned.
  public static var executableName: String {
    splitArguments.last.map(String.init) ?? ""
  }

  /// Returns the executable path of the current process.
  ///
  /// The executable path is constructed by joining the components of `splitArguments`,
  /// excluding the last one (which is the executable name), with "/".
  ///
  /// - Returns: A `String` representing the path to the executable.
  /// - Note: The path returned does not include the executable name itself.
  public static var executablePath: String {
    "/" + splitArguments.dropLast().joined(separator: "/")
  }
}

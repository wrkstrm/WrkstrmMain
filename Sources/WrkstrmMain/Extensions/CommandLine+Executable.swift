extension CommandLine {
  static let splitArguments: [String.SubSequence] = Self.arguments[0].split(separator: "/")

  /// Returns the executable name based on the command-line arguments.
  public static var executableName: String {
    String(splitArguments.last!)
  }
  
  public static var executablePath: String {
    "/" + splitArguments.dropLast().joined(separator: "/")
  }
}

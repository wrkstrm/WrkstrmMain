/// An extension on `Array` where elements are of type `String`.
/// This extension provides utility methods for filtering arrays of file paths based on file types
/// and localization.
extension [String] {
  /// Filters the array to include only source file paths.
  ///
  /// This computed property returns an array containing only the file paths that end with `.m` or
  /// `.swift`. It's useful for isolating source files in a collection of file paths.
  ///
  /// - Returns: An optional array of `String` containing only source file paths, or `nil` if no
  /// source files are found.
  public var sourceFiles: [String]? { filter { $0.contains(".m") || $0.contains(".swift") } }

  /// Filters the array to include only Interface Builder files.
  ///
  /// This computed property returns an array containing only the file paths that end with `.xib` or
  /// `.storyboard`. It's useful for isolating Interface Builder files, such as XIBs and
  /// Storyboards, in a collection of file paths.
  ///
  /// - Returns: An optional array of `String` containing only Interface Builder file paths, or
  /// `nil` if no such files are found.
  public var nibFiles: [String]? { filter { $0.contains(".xib") || $0.contains(".storyboard") } }

  /// Filters the array to include only Base Localization Interface Builder files.
  ///
  /// This computed property returns an array containing only the file paths that include
  /// `Base.lproj`. It's useful for isolating Base Localization files in a collection of Interface
  /// Builder file paths.
  ///
  /// - Returns: An optional array of `String` containing only Base Localization Interface Builder
  /// file paths, or `nil` if no such files are found.
  public var baseLocalizedNibFiles: [String]? { filter { $0.contains("Base.lproj") } }

  /// Filters the array to include only non-localized and non-debug Interface Builder files.
  ///
  /// This computed property returns an array containing only the file paths that do not include
  /// `Base.lproj` and `Debug`. It's useful for isolating non-localized and non-debug Interface
  /// Builder files
  /// in a collection of file paths.
  ///
  /// - Returns: An optional array of `String` containing only non-localized and non-debug Interface
  /// Builder file paths, or `nil` if no such files are found.
  public var unlocalizedNibFiles: [String]? {
    filter { !$0.contains("Base.lproj") && !$0.contains("Debug") }
  }
}

/// An extension on `String` providing a method to convert camel case strings to kebab case.
extension String {
  /// Converts the string from camel case to kebab case.
  ///
  /// This method iterates through each character of the string. When it encounters an uppercase
  /// character, it adds a hyphen before it (unless it's the first character) and converts it to
  /// lowercase. This transformation is particularly useful in contexts where camel case naming
  /// needs to be converted to kebab case for URL slugs, CSS class names, etc.
  ///
  /// For example, "camelCaseString" becomes "camel-case-string".
  ///
  /// - Returns: A new string converted to kebab case.
  public func camelCaseToKebabCase() -> String {
    var result = ""

    for (index, character) in enumerated() {
      if character.isUppercase {
        if index > 0 {
          // Add a hyphen before the uppercase character if it's not the first character
          result += "-"
        }
        result += String(character).lowercased()
      } else {
        result += String(character)
      }
    }

    return result
  }
}

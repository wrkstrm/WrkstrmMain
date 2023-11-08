import Foundation

extension String {
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

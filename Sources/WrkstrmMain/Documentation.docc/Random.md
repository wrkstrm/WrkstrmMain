# `Random`

A namespace for generating random character sequences for use in CLIs, tokens, diagnostics, and
visually compact entropy.

Supports printable ASCII, emoji, and mixed-character string generation with optional exclusion of
visually confusing characters.

## Topics

### Generating Random Strings

- ``WrkstrmMain/Random/printableASCII(length:noConfusing:)``
- ``WrkstrmMain/Random/emoji(length:)``
- ``WrkstrmMain/Random/mixed(length:noConfusing:)``

## Overview

The `Random` namespace provides static functions to generate strings using different character sets.
Printable ASCII covers characters from U+0020 through U+007E, emoji covers glyphs with a default
emoji presentation (excluding modifier and multi-codepoint emoji), and the mixed mode blends the
two. Each function supports variable lengths and, for ASCII and mixed modes, a `noConfusing` option
to exclude characters like `0`, `O`, `1`, `l`, and `I`.

## Example Usage

```swift
Random.printableASCII(length: 6)
// e.g. "x9$Kp!"

Random.emoji(length: 4)
// e.g. "🚀🎯🧁📦"

Random.mixed(length: 5)
// e.g. "a🎯M🚀!"

Random.mixed(length: 5, noConfusing: true)
// e.g. "7🐍x@🌈"
```

## Character Pools

The ASCII pool contains 95 symbols. The emoji pool spans approximately 1,212 characters with
default emoji presentation. The mixed pool combines both for 1,307 total characters—two characters
from the mixed set already represent more than 1.7 million distinct values (`1307^2`).

## Declaration

```swift
enum Random {
  static func printableASCII(length: Int, noConfusing: Bool = false) -> String
  static func emoji(length: Int) -> String
  static func mixed(length: Int, noConfusing: Bool = false) -> String
}
```

## CLI Integration

These functions are used in the `toolbox` CLI under the `random characters` command:

```bash
toolbox random characters --length 6 --kind ascii
toolbox random characters --length 4 --kind emoji
toolbox random characters --length 5 --kind mixed --no-confusing
```

## See Also

- [Unicode Emoji Specification](https://unicode.org/reports/tr51/)
- [Swift ArgumentParser](https://github.com/apple/swift-argument-parser)

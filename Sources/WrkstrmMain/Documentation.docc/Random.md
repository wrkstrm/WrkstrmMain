# `Random`

`Random` provides printable ASCII generators for CLIs, diagnostics, and other utilities that
benefit from lightweight entropy without external dependencies.

Emoji-specific generators now live in the `WrkstrmEmoji` package. Add that library when you need
single-scalar emoji catalogs or mixed ASCII + emoji sequences.

## Topics

### Generating Random Strings

- ``WrkstrmMain/Random/printableASCII(length:noConfusing:)``

## Overview

`Random.printableASCII(length:noConfusing:)` produces strings drawn from the printable ASCII range
(`U+0020` through `U+007E`). When `noConfusing` is `true`, ambiguous glyphs such as `0`, `O`, `1`,
`l`, and `I` are removed to improve legibility in passwords, invite codes, or token displays.

## Example Usage

```swift
Random.printableASCII(length: 6)
// e.g. "x9$Kp!"

Random.printableASCII(length: 6, noConfusing: true)
// e.g. "Tz7@#%"
```

For emoji catalogs or mixed ASCII + emoji strings, depend on `WrkstrmEmoji` and call
`EmojiRandomizer`.

## Declaration

```swift
enum Random {
  static func printableASCII(length: Int, noConfusing: Bool = false) -> String
}
```

## CLI Integration

The ASCII generator powers the `toolbox random characters --kind ascii` flow. Emoji-aware command
variants should migrate to `WrkstrmEmoji.EmojiRandomizer`.

## See Also

- [Unicode Emoji Specification](https://unicode.org/reports/tr51/)
- WrkstrmEmoji documentation bundle

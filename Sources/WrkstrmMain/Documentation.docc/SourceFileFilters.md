# Source File Filters

Utilities on arrays of path strings for picking out specific kinds of files.

## Overview

The `[String]` extension defines four computed properties that help separate source and Interface
Builder files from a mixed list of paths.

## Examples

```swift
let files = [
  "View.swift",
  "Main.storyboard",
  "Base.lproj/Main.storyboard",
  "Base.lproj/Settings.xib",
  "Debug/Main.storyboard",
]

files.sourceFiles
// ["View.swift"]

files.nibFiles
// ["Main.storyboard", "Base.lproj/Main.storyboard", "Base.lproj/Settings.xib", "Debug/Main.storyboard"]

files.baseLocalizedNibFiles
// ["Base.lproj/Main.storyboard", "Base.lproj/Settings.xib"]

files.unlocalizedNibFiles
// ["Main.storyboard"]
```

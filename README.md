# 🏎️ WrkstrmMain

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwrkstrm%2FWrkstrmMain%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/wrkstrm/WrkstrmMain)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fwrkstrm%2FWrkstrmMain%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/wrkstrm/WrkstrmMain)

[![🧹 Swift Lint| WrkstrmMain](https://github.com/wrkstrm/WrkstrmMain/actions/workflows/wrkstrm-main-swiftlint.yml/badge.svg)](https://github.com/wrkstrm/WrkstrmMain/actions/workflows/wrkstrm-main-swiftlint.yml)
[![🚧 Swift Test| WrkstrmMainTests](https://github.com/wrkstrm/WrkstrmMain/actions/workflows/wrkstrm-main-tests-swift.yml/badge.svg)](https://github.com/wrkstrm/WrkstrmMain/actions/workflows/wrkstrm-main-tests-swift.yml)
---

`WrkstrmMain` provides extensions to the Swift Main library, adding functionalities for string manipulation, collection processing, and more. Tested via GitHub Actions.

## 🔑 Key Features

- **🌐 Extended Swift Library**: Enhancements for string manipulation and collection processing.
- **🚀 Performance Oriented**: Optimized for efficiency and speed.
- **🔧 Versatile and Flexible**: Adaptable to a wide range of development needs.

## Compatibility

- macOS
- Linux

## 📦 Installation

To integrate `WrkstrmMain` into your project, follow these steps:

### 🛠 Swift Package Manager

Add `WrkstrmMain` as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/wrkstrm/WrkstrmMain.git", .upToNextMajor(from: "2.0.0"))
]
```

Include `WrkstrmMain` in your target dependencies:

```swift
targets: [
    .target(name: "YourTarget", dependencies: ["WrkstrmMain"]),
]
```

## 📚 Usage

Import `WrkstrmMain` and utilize its extensions:

1. **📥 Import the Library**:

   ```swift
   import WrkstrmMain
   ```

2. **🔨 Utilize Extensions**:
   Leverage various extensions for enhanced functionality:

Example Extensions:

### String Extensions

- `camelCaseToKebabCase()`: Convert a camelCase string to kebab-case.
- `containsUniqueChars()`: Check if a string contains all unique characters.
- `isPermutation(_:)`: Check if a string is a permutation of another string.

### Collection Extensions

- `search(key:)`: Binary search in a collection.
- `mergeSort()`: Perform a merge sort on a collection.

### Protocol `AnyFlattenable`

- `flattened()`: Unwrap and flatten any value, potentially to `nil`.

### `Optional` Comparable Extension

- `Optional<T>` where `T: Comparable & Equatable`: Adds comparison functionality to Optionals.

## 🎨 Customization

Customize and extend `WrkstrmMain` to suit your project's specific needs.

## 🤝 Contributing

🌟 Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📜 License

📄 Distributed under the MIT License. See `LICENSE` for more information.

## 📬 Contact

🔗 Project Link: [https://github.com/wrkstrm/WrkstrmMain](https://github.com/wrkstrm/WrkstrmMain)

## 💖 Acknowledgments

- Developed by github.com/@rismay

---

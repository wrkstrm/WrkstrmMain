extension [String] {
  public var sourceFiles: [String]? { filter { $0.contains(".m") || $0.contains(".swift") } }

  public var nibFiles: [String]? { filter { $0.contains(".xib") || $0.contains(".storyboard") } }

  public var baseLocalizedNibFiles: [String]? { filter { $0.contains("Base.lproj") } }

  public var unlocalizedNibFiles: [String]? {
    filter { !$0.contains("Base.lproj") && !$0.contains("Debug") }
  }
}

Pod::Spec.new do |s|
  require_relative 'Utils/spec'
  s.extend MetaCodable::Spec
  s.module_name = "PluginCore"
  s.define(false)  # Don't auto-set source_files
  s.dependency 'SwiftSyntax/Lib', *s.swift_syntax_constraint
  s.dependency 'SwiftSyntax/Diagnostics', *s.swift_syntax_constraint
  s.dependency 'SwiftSyntax/Builder', *s.swift_syntax_constraint
  s.dependency 'SwiftSyntax/Macros', *s.swift_syntax_constraint
  
  # Use vendored swift-collections instead of external dependency
  # Previously: s.dependency 'SwiftyCollections/OrderedCollections', '~> 1.0.4'
  
  # Include PluginCore sources (now includes OrderedCollections internally)
  s.source_files = "Sources/#{s.module_name}/**/*.swift"
  
  # Exclude test files from OrderedCollections
  s.exclude_files = "Sources/#{s.module_name}/OrderedCollections/**/*+Testing.swift"

  s.pod_target_xcconfig = {
    'OTHER_SWIFT_FLAGS' => "-Xfrontend -package-name -Xfrontend MetaCodable"
  }
end

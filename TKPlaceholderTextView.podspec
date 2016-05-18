Pod::Spec.new do |s|
  s.name         = "TKPlaceholderTextView"
  s.version      = "1.0.0"
  s.summary      = "A textview with placeholder"
  s.license      = { :type => 'MIT License', :file => 'LICENSE' } # 协议
  s.homepage     = "https://github.com/TBXark/TKPlaceholderTextView"
  s.author       = { "TBXark" => "tbxark@outlook.com" }
  s.source       = { :git => "https://github.com/TBXark/TKPlaceholderTextView.git", :tag => s.version }
  s.platform     = :ios, '8.0'
  s.source_files = 'TKPlaceholderTextView/TKPlaceholderTextView.swift'
  s.requires_arc = true
end

Pod::Spec.new do |s|
  s.name             = 'WordWrapLabel'
  s.version          = '1.0.0'
  s.summary          = 'A short description of WordWrapLabel.'

  s.description      = <<-DESC
A UILabel subclass that really makes sure that every word in the labels text fits into one line.
                       DESC

  s.homepage         = 'https://github.com/PhilippOtto89/WordWrapLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Philipp' => 'philipp.otto@outlook.com' }
  s.source           = { :git => 'https://github.com/PhilippOtto89/WordWrapLabel.git', :tag => s.version.to_s }
  s.swift_version    = '4.2'

  s.ios.deployment_target = '8.0'

  s.source_files = 'WordWrapLabel/Classes/**/*'
  
end

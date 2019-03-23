Pod::Spec.new do |s|
  s.name             = 'WordWrapLabel'
  s.version          = '1.0.0'
  s.summary          = 'A short description of WordWrapLabel.'

  s.description      = <<-DESC
A UILabel subclass that really makes sure that every word in the label´s text fits into one line.
The standard UILabel can automatically adjust the scale of the font size to make the whole text fit the label bounds but it doesn´t take into account the actual length of the different words of the given text. This results in words being broken up into multiple lines because they are too long to fit one line.
The WordWrapLabel finds the suitable font size to make every word of the given text fit into one line and also makes sure that the text fits into the whole bounds of the label.
                       DESC

  s.homepage         = 'https://github.com/PhilippOtto89/WordWrapLabel'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Philipp' => 'philipp.otto@outlook.com' }
  s.source           = { :git => 'https://github.com/PhilippOtto89/WordWrapLabel.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'WordWrapLabel/Classes/**/*'
  
end

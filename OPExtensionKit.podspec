Pod::Spec.new do |s|
  s.name     = 'OPExtensionKit'
  s.version  = '0.1.0'
  s.license  = 'MIT'

  s.summary  = 'Shared extensions used in Opetopic projects.'
  s.homepage = 'https://github.com/mbrandonw/OPExtensionKit'
  s.author   = { 'Brandon Williams' => 'brandon@opetopic.com' }
  s.source   = { :git => 'git@github.com:mbrandonw/OPExtensionKit.git' }

  s.source_files = 'OPExtensionKit/Source/**/*.{h,m}'
  s.requires_arc = true

  s.frameworks = 'CoreData', 'QuartzCore', 'MapKit'
end

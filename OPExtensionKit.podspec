Pod::Spec.new do |s|
  s.name     = 'OPExtensionKit'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  
  s.summary  = 'Shared extensions used in Opetopic projects.'
  s.homepage = 'https://brandonwilliams.beanstalkapp.com/opextensionkit'
  s.author   = { 'Brandon Williams' => 'brandon@opetopic.com' }
  s.source   = { :git => 'git@brandonwilliams.beanstalkapp.com:/opextensionkit.git' }
  
  s.source_files = 'Source/**/*.{h,m}'
  
  s.frameworks = 'CoreData', 'QuartzCore', 'MapKit'
  
  s.dependency 'BlocksKit', '~> 1.0.2'

end
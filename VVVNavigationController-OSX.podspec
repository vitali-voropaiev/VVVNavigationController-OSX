Pod::Spec.new do |s|
  s.name         = 'VVVNavigationController-OSX'
  s.version      = '1.0.0'
  s.license      =  {:type => 'MIT', :file=> 'LICENSE'}
  s.homepage     = 'https://github.com/Cronos/VVVNavigationController-OSX'
  s.author       = { 'Vitaliy Voropaev' => 'vvv@anahoret.com' }
  s.summary      = 'Provide navigation to a stack of view controllers.'

# Source Info
  s.osx.deployment_target = '10.9'
  s.source       = { :git => 'https://github.com/Cronos/VVVNavigationController-OSX.git', :tag => s.version.to_s }
  s.source_files = 'VVVNavigationController/*.{h,m}'
  s.framework    = 'Cocoa'
  s.requires_arc = true

end
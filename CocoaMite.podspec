Pod::Spec.new do |s|
  s.name         = "CocoaMite"
  s.version      = "0.0.1"
  s.summary      = "CocoaMite is an Objective-C wrapper around the mite API."
  s.description  = <<-DESC
                   CocoaMite is an Objective-C wrapper around the [mite API](http://mite.yo.lk/api/ "mite API").
				   [mite](http://mite.yo.lk/ "mite") is 'sleek time tracking for teams & freelancers'.
                   DESC
  s.homepage     = "http://github.com/bfolder/CocoaMite"
  s.license      = 'MIT'
  s.author       = { "Heiko Dreyer" => "mail@boxedfolder.com" }
  s.ios.deployment_target = '5.0'
  s.osx.deployment_target = '10.7'
  s.source       = { :git => "https://github.com/bfolder/CocoaMite.git", :tag => "0.0.1" }
  s.source_files  = 'CocoaMite/**/*.{h,m}'
  s.public_header_files = 'CocoaMite/**/*.h'
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 1.3.2'
end

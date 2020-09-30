
Pod::Spec.new do |s|
  s.name             = "WSPopup"
  s.version          = "4.0.0"
  s.summary          = "A simple and flexible way to show a view to the screen."
  s.homepage         = "https://github.com/whitesmith/WSPopup"
  s.license          = 'MIT'
  s.author           = { "Ricardo Pereira" => "m@ricardopereira.eu" }
  s.source           = { :git => "https://github.com/whitesmith/WSPopup.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/whitesmithco'

  s.platform     = :ios, '9.0'
  s.requires_arc = true
  s.swift_version = '5.0'

  s.source_files = 'WSPopup/*.{h}', 'Source/**/*.{h,swift}'
end

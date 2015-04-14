Pod::Spec.new do |spec|
  spec.name         = 'NgEmojiMap'
  spec.version      = '1.1'
  spec.summary      = "A simple objective-c class that encapsulates emoji-alias mapping (mapping from github/gemoji)."
  spec.homepage     = 'https://github.com/meiwin/NgEmojiMap'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Meiwin Fu' => 'meiwin@blockthirty.com' }
  spec.source       = { :git => 'https://github.com/meiwin/NgEmojiMap.git', :tag => "v#{spec.version}" }
  spec.source_files = 'NgEmojiMap/*.{h,m}'
  spec.resource     = 'NgEmojiMap/NgEmojiMap.bundle'
  spec.frameworks   = 'Foundation'
  spec.ios.deployment_target = '5.0'
  spec.requires_arc = true
end
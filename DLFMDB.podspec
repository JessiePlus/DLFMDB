Pod::Spec.new do |s|
s.name = 'DLFMDB'
s.version = '0.1.0'
s.summary = 'A Cocoa / Objective-C wrapper around FMDB.'
s.homepage = 'https://github.com/LinDing/DLFMDB'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'LinDing' => 'dinglin1991@yeah.net' }
s.source           = { :git => 'https://github.com/LinDing/DLFMDB.git', :tag => s.version.to_s }
s.ios.deployment_target = '8.0'
s.requires_arc = true
s.default_subspec = 'standard'

# use the built-in library version of sqlite3
s.subspec 'standard' do |ss|
ss.library = 'sqlite3'
ss.source_files = 'DLFMDB/Classes/**/*'
ss.dependency 'FMDB'
end

end

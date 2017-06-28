#
# Be sure to run `pod lib lint SweetsSdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SweetsSdk'
  s.version          = '0.1.0'
  s.summary          = 'Sweets client integration module.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC
  s.homepage         = 'https://github.com/vast-z/IOS_SweetsSdk'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'vast-z' => 'hz.zhao@aiesst.com' }
  s.source           = { :git => 'https://github.com/vast-z/IOS_SweetsSdk.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.library='c++','z','sqlite3'
  s.frameworks='SystemConfiguration', 'CFNetwork', 'Security', 'CoreTelephony', 'AVFoundation','CoreLocation'
  s.vendored_libraries='SweetsSdk/Classes/Plugins/cordova-plugin-payment/*.a'
  s.ios.deployment_target ='8.0'
  s.source_files='SweetsSdk/Classes/**/*'
  # s.resource_bundles = {
  #    'SweetsSdk' => ['SweetsSdk/Assets/*']
  # }
  s.public_header_files='SweetsSdk/Classes/src/SweetsSdk.h'
  s.dependency 'Cordova','~>4.4.0'
end
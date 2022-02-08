#
# Be sure to run `pod lib lint BadgeLog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'BadgeLog'
  s.version          = '0.2'
  s.summary          = 'BadgeLog, a light lib that helps and centralize logs in your application.'
  s.swift_version    = '5.0'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'BadgeLog, a light lib that helps and centralize logs in your application. Configure logs to run on console or save into file. Centralize all your logs logic inside this lib.'

  s.homepage         = 'https://github.com/Badge87/BadgeLog'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Badge87' => 'bacdaniele@gmail.com' }
  s.source           = { :git => 'https://github.com/Badge87/BadgeLog.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '15.0'
  s.pod_target_xcconfig = { 'PRODUCT_BUNDLE_IDENTIFIER': 'com.danielebachicchi.badgelog' }
  

  s.source_files = 'BadgeLog/Classes/**/*'

  # s.resource_bundles = {
  #   'BadgeLog' => ['BadgeLog/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
end

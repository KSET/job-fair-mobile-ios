# Uncomment the next line to define a global platform for your project
platform :ios, '9.1'

# ignore all warnings from all pods
inhibit_all_warnings!

target 'JobFair' do
  use_frameworks!

  # Pods for JobFair
  	pod 'RxSwift'
    pod 'SwiftLint'
    pod 'Kingfisher'
    pod 'Apollo', :git => 'https://github.com/apollographql/apollo-ios.git'
    pod 'XLPagerTabStrip'
    pod 'FeedKit'
    pod 'GoogleMaps'
    pod 'SkyFloatingLabelTextField', '~> 3.6.0'
    pod 'RxKeyboard'
    pod 'FanMenu', :git => 'https://github.com/exyte/fan-menu'
    pod 'DateToolsSwift'
    pod 'SnapKit'
    pod 'Cosmos'
    pod 'BarcodeScanner', '~> 4.1.3'

  target 'JobFairTests' do
    inherit! :search_paths
    pod 'Quick'
    pod 'Nimble', '8.0'
  end
end

swift4Targets = ['BarcodeScanner']
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if swift4Targets.include? target.name
        config.build_settings['SWIFT_VERSION'] = '4'
      end
    end
  end
end

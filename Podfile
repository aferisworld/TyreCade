source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '9.0'
#use_frameworks!
target 'TyreCade' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for TyreCade
   pod 'Alamofire'
   pod 'SwiftyJSON'
   pod 'RealmSwift', '~> 3.20.0'
   pod 'PromiseKit', '~> 6.0'
   pod 'PromiseKit/Alamofire', '~> 6.0'
   pod 'TinyConstraints'
      
  target 'TyreCadeTests' do
    use_frameworks!
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '5.0'
        end
    end
end

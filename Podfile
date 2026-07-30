# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Linko' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Linko


  pod 'lottie-ios'
  pod 'Socket.IO-Client-Swift', '~> 16.1'
  pod 'Alamofire', '~> 5.9.0'
  pod 'SnapKit'
  pod 'Kingfisher'
  pod 'RxSwift'
  pod 'RxCocoa'



  target 'LinkoTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'LinkoUITests' do
    # Pods for testing
  end

end
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
    end
  end
end

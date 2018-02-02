# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'CurrencyInfo' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  pod 'RealmSwift'
  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa'
  pod 'Alamofire'
  #pod 'ModelMapper'
  # pod 'SwiftyJSONRealmObject'
   pod 'ObjectMapper', '~> 3.1'
   pod 'RxRealm'
   pod 'Firebase/Core'
  # Pods for CurrencyInfo
  def testing_pods
  pod 'Quick', :git => 'https://github.com/Quick/Quick.git', :branch => 'master'
  pod 'Nimble', :git => 'https://github.com/Quick/Nimble.git', :branch => 'master'
  end

  target 'CurrencyInfoTests' do
    testing_pods
  end
  target 'CurrencyInfoUITests' do
    testing_pods
  end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        if target.name == 'Quick' || target.name == 'Nimble'
            print "Changing Quick swift version to 3.2\n"
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end
    end
end
end

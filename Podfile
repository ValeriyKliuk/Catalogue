# Uncomment the next line to define a global platform for your project
platform :ios, '12.1'

target 'Catalogue' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Catalogue
    pod 'SwiftyJSON', '~> 4.0'
    pod 'SVProgressHUD', '~> 2.2.5'

  target 'CatalogueTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.2'
        end
    end
end

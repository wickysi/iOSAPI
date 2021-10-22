# source 'https://github.com/CocoaPods/Specs.git'
source 'https://cdn.cocoapods.org/'
# source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'

platform :ios, '11.0'
use_frameworks!

target 'iOSAPI' do
  	pod "Masonry" 
  	
	pod 'AFNetworking', '~> 4.0'

	pod 'SDWebImage', '~> 5.0'
    pod 'FLAnimatedImage'

    pod 'MBProgressHUD'
    
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
        end
    end
end


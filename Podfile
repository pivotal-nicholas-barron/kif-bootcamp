source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '8.0'

target 'KIFBootcamp' do
   pod 'Parse'
end

target 'KIFBootcampTests', :exclusive => true do
   pod 'KIF', '~>3.0'
   pod 'Nocilla'
end


PROJECT_NAME = 'KIFBootcamp'
TEST_TARGET = 'KIFBootcampEGTests'
SCHEME_FILE = 'KIFBootcampEGTests.xcscheme'

target 'KIFBootcampEGTests', :exclusive => true do
    pod 'EarlGrey'
end

post_install do |installer|
    load('configure_earlgrey_pods.rb')
    configure_for_earlgrey(installer, PROJECT_NAME, TEST_TARGET, SCHEME_FILE)
end

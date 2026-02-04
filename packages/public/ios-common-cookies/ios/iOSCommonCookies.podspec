Pod::Spec.new do |s|
  s.name           = 'iOSCommonCookies'
  s.version        = '1.0.0'
  s.summary        = 'Sync cookies between HTTPCookieStorage and WKWebView'
  s.description    = 'Expo iOS module that syncs cookies between HTTPCookieStorage and WKWebsiteDataStore.httpCookieStore.'
  s.author         = 'Telefónica'
  s.homepage       = 'https://github.com/telefonica/platform-react-native-modules'
  s.platforms      = {
    :ios => '13.0'
  }
  s.source         = { git: 'https://github.com/telefonica/platform-react-native-modules.git', tag: s.version.to_s }
  s.static_framework = true

  s.dependency 'ExpoModulesCore'

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
  }

  s.source_files = "**/*.{h,m,mm,swift,hpp,cpp}"
end

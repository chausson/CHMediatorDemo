Pod::Spec.new do |s|

  s.name         = "CHMediator"
  s.version      = "0.1"
  s.summary      = "Reslove Modules relationship class "
#  s.description  = "Fix WebView of  CHViewController Title Reset Bug"
  s.homepage     = "https://github.com/chausson/CHMediatorDemo.git"
  s.license      = "MIT"
  s.author       = { "Chausson" => "232564026@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/chausson/CHWebView.git",
                     :tag => s.version}
  s.source_files  = "CHMediator"
end

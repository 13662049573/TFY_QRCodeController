
Pod::Spec.new do |spec|
  spec.name         = "TFY_ScannerQR"

  spec.version      = "2.0.4"

  spec.summary      = "封装好的二维码和条形码共存，更好方便使用。"

  spec.description  = <<-DESC
  封装好的二维码和条形码共存，更好方便使用。
                   DESC

  spec.homepage     = "https://github.com/13662049573/TFY_QRCodeController"
  
  spec.license      = "MIT"
 
  spec.author       = { "tfyzxc13662049573" => "420144542@qq.com" }
  
  spec.platform     = :ios, "10.0"

  spec.source       = { :git => "https://github.com/13662049573/TFY_QRCodeController.git", :tag => spec.version }

  spec.source_files  = "TFY_QRCodeController/TFY_ScannerQR/*.{h,m}","TFY_QRCodeController/TFY_ScannerQR/TFY_ScannerQRHeader.h"
  
  spec.resources     = "TFY_QRCodeController/TFY_ScannerQR/TFY_resource.bundle"

  spec.frameworks    = "Foundation","UIKit"

  spec.xcconfig      = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/AvailabilityMacros" }

  spec.requires_arc  = true
end

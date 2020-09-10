//
//  TFY_ScannerQR.h
//  TFY_QRCodeController
//
//  Created by 田风有 on 2020/9/10.
//  Copyright © 2020 田风有. All rights reserved.
//  最新版本号:2.0.8

#import <Foundation/Foundation.h>

FOUNDATION_EXPORT double TFY_ScannerQRVersionNumber;

FOUNDATION_EXPORT const unsigned char TFY_ScannerQRVersionString[];

#define TFY_ScannerQRRelease 0

#if TFY_ScannerQRRelease

#import <TFY_ScannerQR/TFY_ScanView.h>
#import <TFY_ScannerQR/TFY_ScanViewController.h>

#else

#import "TFY_ScanView.h"
#import "TFY_ScanViewController.h"

#endif

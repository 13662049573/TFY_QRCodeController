//
//  TFY_ScanViewController.h
//  TFY_QRCodeController
//
//  Created by 田风有 on 2019/6/13.
//  Copyright © 2019 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TFY_ScanView.h"


NS_ASSUME_NONNULL_BEGIN

@interface TFY_ScanViewController : UIViewController
/**
 * 初始化二维码扫描控制器  type 扫码类型 finish 扫码完成回调 ScanViewController对象
 */
- (instancetype)initWithQrType:(TFY_ScanType)type onFinish:(void (^)(NSString *result, NSError *error))finish;


/**
 * 识别二维码  image UIImage对象  finish 识别结果
 */
+ (void)recognizeQrCodeImage:(UIImage *)image onFinish:(void (^)(NSString *result))finish;

/**
 * 生成二维码【白底黑色】content 二维码内容字符串【数字、字符、链接等】 size 生成图片的大小 UIImage图片对象
 */
+ (UIImage*)createQRImageWithString:(NSString*)content QRSize:(CGSize)size;

/**
 * 生成二维码【自定义颜色】content 二维码内容字符串【数字、字符、链接等】size 生成图片的大小 qrColor 二维码颜色 bkColor 背景色 UIImage图片对象
 */
+ (UIImage* )createQRImageWithString:(NSString*)content QRSize:(CGSize)size QRColor:(UIColor*)qrColor bkColor:(UIColor*)bkColor;


/**
 * 生成条形码【白底黑色】content 条码内容【一般是数字】 size 生成条码图片的大小 UIImage图片对象
 */
+ (UIImage *)createBarCodeImageWithString:(NSString *)content barSize:(CGSize)size;


/**
 * 生成条形码【自定义颜色】content 条码内容【一般是数字】 size 生成条码图片的大小 qrColor 码颜色 bkColor 背景颜色 UIImage图片对象
 */
+ (UIImage* )createBarCodeImageWithString:(NSString*)content QRSize:(CGSize)size QRColor:(UIColor*)qrColor bkColor:(UIColor*)bkColor;
@end

NS_ASSUME_NONNULL_END

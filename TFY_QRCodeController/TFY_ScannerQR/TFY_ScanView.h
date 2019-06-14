//
//  TFY_ScanView.h
//  TFY_QRCodeController
//
//  Created by 田风有 on 2019/6/13.
//  Copyright © 2019 田风有. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TFY_ScanTypeQrCode,
    TFY_ScanTypeBarCode,
    TFY_ScanTypeAll,
} TFY_ScanType;


@interface TFY_ScanView : UIView

-(id)initWithFrame:(CGRect)frame style:(NSString *)style;

- (void)stopAnimating;

@property (nonatomic, assign) TFY_ScanType scanType;
@end

NS_ASSUME_NONNULL_END

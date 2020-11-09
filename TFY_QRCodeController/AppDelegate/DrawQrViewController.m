//
//  DrawQrViewController.m
//  TFY_QRCodeController
//
//  Created by 田风有 on 2019/6/14.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "DrawQrViewController.h"
#import "TFY_ScanViewController.h"
@interface DrawQrViewController ()
@property(nonatomic , strong)UITextField *textfiled;

@property(nonatomic , strong)UIImageView *imageViews;

@property(nonatomic , strong)UIButton *btns;
@end

@implementation DrawQrViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"绘制二维码";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.textfiled];
    self.textfiled.tfy_LeftSpace(30).tfy_TopSpace(64).tfy_RightSpace(30).tfy_Height(40);
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage:)];
    [self.imageViews addGestureRecognizer:tap];
    [self.view addSubview:self.imageViews];
    self.imageViews.tfy_LeftSpace(30).tfy_TopSpaceToView(20, self.textfiled).tfy_RightSpace(30).tfy_Height(250);
    
    [self.view addSubview:self.btns];
    self.btns.tfy_LeftSpace(80).tfy_TopSpaceToView(30, self.imageViews).tfy_RightSpace(80).tfy_Height(50);
}

- (void)createQrBtnClicked:(id)sender {
    
    if (self.textfiled.text == nil || self.textfiled.text.length == 0) {
        self.textfiled.text = @"ee:4e:8u:YA,djkhfkakfnkanfaf";
    }
    
    UIImage *image = [TFY_ScanViewController createQRImageWithString:self.textfiled.text QRSize:CGSizeMake(250, 250) QRColor:[UIColor blackColor] bkColor:[UIColor colorWithRed:0.318 green:0.690 blue:0.839 alpha:1.00]];
    
    [self.imageViews setImage: image];
    
}

//长按保存图片
- (void)tapImage:(id)sender {
    
    if(self.imageViews.image) {
        UIImageWriteToSavedPhotosAlbum(self.imageViews.image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    } else {
        [self showInfo:@"请先生成二维码"];
    }
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
    if(error) {
        [self showInfo:[NSString stringWithFormat:@"error: %@",error]];
    } else {
        [self showInfo:@"保存成功"];
    }
}

#pragma mark - Error handle
- (void)showInfo:(NSString*)str {
    [self showInfo:str andTitle:@"提示"];
}

- (void)showInfo:(NSString*)str andTitle:(NSString *)title
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:str preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *action1 = ({
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:NULL];
        action;
    });
    [alert addAction:action1];
    [self presentViewController:alert animated:YES completion:NULL];
}

-(UITextField *)textfiled{
    if (!_textfiled) {
        _textfiled = [UITextField new];
        _textfiled.text = @"ee:4e:8u:YA,djkhfkakfnkanfaf";
    }
    return _textfiled;
}

-(UIImageView *)imageViews{
    if (!_imageViews) {
        _imageViews = UIImageViewSet();
        _imageViews.makeChain.userInteractionEnabled(YES);
    }
    return _imageViews;
}

-(UIButton *)btns{
    if (!_btns) {
        _btns = UIButtonSet();
        _btns.makeChain
        .text(@"生产二维码", UIControlStateNormal)
        .textColor([UIColor tfy_colorWithHex:@"ffffff"], UIControlStateNormal)
        .font([UIFont boldSystemFontOfSize:15])
        .addTarget(self, @selector(createQrBtnClicked:), UIControlEventTouchUpInside)
        .backgroundColor([UIColor tfy_colorWithHex:@"A538FE"]);
    }
    return _btns;
}


@end

//
//  ViewTableViewCell.m
//  TFY_QRCodeController
//
//  Created by 田风有 on 2019/6/13.
//  Copyright © 2019 田风有. All rights reserved.
//

#import "ViewTableViewCell.h"

@interface ViewTableViewCell ()
@property(nonatomic , strong)UIView *back_View;
@property(nonatomic , strong)UILabel *title_label;
@property(nonatomic , strong)UIImageView *ico_imageView;
@end

@implementation ViewTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.back_View];
        self.back_View.tfy_LeftSpace(20).tfy_TopSpace(10).tfy_RightSpace(20).tfy_BottomSpace(10);
        
        [self.back_View addSubview:self.title_label];
        self.title_label.tfy_LeftSpace(20).tfy_TopSpace(0).tfy_RightSpace(20).tfy_BottomSpace(0);
        
        [self.back_View addSubview:self.ico_imageView];
        self.ico_imageView.tfy_RightSpace(20).tfy_CenterY(0).tfy_size(6, 10);
    }
    return self;
}

-(void)setText_str:(NSString *)text_str{
    _text_str = text_str;
    
    self.title_label.makeChain.text(_text_str);
}


-(UIView *)back_View{
    if (!_back_View) {
        _back_View = [UIView new];
        _back_View.backgroundColor = [UIColor whiteColor];
        [_back_View tfy_setShadow:CGSizeMake(0, 0) shadowOpacity:0.3 shadowRadius:5 shadowColor:[UIColor blackColor]];
        _back_View.layer.cornerRadius = 15;
    }
    return _back_View;
}

-(UILabel *)title_label{
    if (!_title_label) {
        _title_label = UILabelSet();
        _title_label.makeChain
        .textColor([UIColor tfy_colorWithHex:@"212121"])
        .font([UIFont boldSystemFontOfSize:15])
        .textAlignment(NSTextAlignmentCenter);
    }
    return _title_label;
}

-(UIImageView *)ico_imageView{
    if (!_ico_imageView) {
        _ico_imageView = UIImageViewSet();
        _ico_imageView.makeChain.image([UIImage imageNamed:@"jiantou"]);
    }
    return _ico_imageView;
}
@end

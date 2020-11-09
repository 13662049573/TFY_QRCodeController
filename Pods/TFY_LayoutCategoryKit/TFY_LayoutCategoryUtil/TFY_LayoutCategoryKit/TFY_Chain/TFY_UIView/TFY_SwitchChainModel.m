//
//  TFY_SwitchChainModel.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "TFY_SwitchChainModel.h"
#define TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION(TFY_Method,TFY_ParaType) TFY_CATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(TFY_Method,TFY_ParaType, TFY_SwitchChainModel *,UISwitch)
@implementation TFY_SwitchChainModel

TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION(on, BOOL);
TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION(onTintColor, UIColor *);
TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION(thumbTintColor, UIColor *);

TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION(onImage, UIImage *);
TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION(offImage, UIImage *);

@end
TFY_CATEGORY_VIEW_IMPLEMENTATION(UISwitch, TFY_SwitchChainModel)
#undef TFY_CATEGORY_CHAIN_SWITCH_IMPLEMENTATION

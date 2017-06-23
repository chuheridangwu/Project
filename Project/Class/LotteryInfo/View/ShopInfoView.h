//
//  ShopInfoView.h
//  Project
//
//  Created by dym on 2017/6/23.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GAGoodsEvaEntity;
@interface ShopInfoView : UIView
+ (instancetype)shareShopInfoView;
- (void)showWithShopInfo:(GAGoodsEvaEntity*)entity;
@end

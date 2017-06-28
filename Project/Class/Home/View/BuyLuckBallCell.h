//
//  BuyLuckBallCell.h
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"
@protocol BuyLuckBallCellDelegate;
#define BuyLuckBallCellHeigth   (100)
@class HomeLuckBallEntity;
@interface BuyLuckBallCell : XBBaseTableViewCell
@property (nonatomic,weak)id<BuyLuckBallCellDelegate> delegate;
@property (nonatomic,strong)HomeLuckBallEntity *entity;
- (void)setTitleText:(NSString*)text;
@end

@protocol BuyLuckBallCellDelegate  <NSObject>

- (void)clickBtnText:(UIButton*)btn;

@end

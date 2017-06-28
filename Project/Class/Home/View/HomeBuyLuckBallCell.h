//
//  BuyLuckBallCell.h
//  Project
//
//  Created by dym on 2017/6/27.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

#define HomeBuyLuckBallCellHeigth  (160)

@class HomeLuckBallEntity;
@protocol HomeBuyLuckBallCellHeight;
@interface HomeBuyLuckBallCell : XBBaseTableViewCell
@property (nonatomic,weak)id<HomeBuyLuckBallCellHeight>  delegate;
@property (nonatomic,strong)NSArray *dataArray;
@end

@protocol HomeBuyLuckBallCellHeight <NSObject>

- (void)clickPushEntity:(HomeLuckBallEntity*)entity;
@end

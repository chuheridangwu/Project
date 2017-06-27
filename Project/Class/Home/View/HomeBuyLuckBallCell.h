//
//  BuyLuckBallCell.h
//  Project
//
//  Created by dym on 2017/6/27.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

#define HomeBuyLuckBallCellHeigth  (160)
@protocol HomeBuyLuckBallCellHeight;
@interface HomeBuyLuckBallCell : XBBaseTableViewCell
@property (nonatomic,weak)id<HomeBuyLuckBallCellHeight>  delegate;
@end

@protocol HomeBuyLuckBallCellHeight <NSObject>


@end

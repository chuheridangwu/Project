//
//  StoreTableViewCell.h
//  Project
//
//  Created by dym on 2017/6/27.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

#define StoreTableViewCellHeight (80)
@class StoreEntity;
@protocol StoreTableViewCellDelegate;
@interface StoreTableViewCell : XBBaseTableViewCell
@property (nonatomic,weak)id<StoreTableViewCellDelegate> delegate;
@property (nonatomic,strong)StoreEntity *entity;
@end

@protocol StoreTableViewCellDelegate <NSObject>
- (void)getLocation;

@end

//
//  HomeListSectionCell.h
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#define HomeListSectionCellHeigth (60)
#import "XBBaseTableViewCell.h"
#import "HomeDataEntity.h"

@protocol HomeListSectionCellDelegate;
@interface HomeListSectionCell : XBBaseTableViewCell
@property (nonatomic,weak)id<HomeListSectionCellDelegate> delegate;
@property (nonatomic,strong)NSArray *array;
@end

@protocol HomeListSectionCellDelegate  <NSObject>

- (void)clickHomeListSectionCell:(HomeDataEntity*)WebURL;
@end

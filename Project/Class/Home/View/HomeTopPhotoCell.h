//
//  HomeTopPhotoCell.h
//  Project
//
//  Created by 董玉毛 on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

@interface HomeTopPhotoCell : XBBaseTableViewCell
- (void)loadCell;

@end

@protocol HomeTopPhotoCellDelegate <NSObject>
//- (void)clickScrollViewImgViewEntity:(CustominCenterEntity*)entity;

@end

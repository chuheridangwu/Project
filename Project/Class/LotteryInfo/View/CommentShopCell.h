//
//  CommentShopCell.h
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"

@class CommentEntity;
@interface CommentShopCell : XBBaseTableViewCell
@property (nonatomic,strong)CommentEntity *entity;
+ (CGFloat)goodsEvationHeight:(id)info;
@end

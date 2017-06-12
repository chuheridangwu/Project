//
//  BaseDataTabCell.h
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewCell.h"
@class BaseDataEntity;
@interface BaseDataTabCell : XBBaseTableViewCell
@property (nonatomic,strong)BaseDataEntity *entity;

@property (nonatomic,assign)BOOL isLayer;
@end

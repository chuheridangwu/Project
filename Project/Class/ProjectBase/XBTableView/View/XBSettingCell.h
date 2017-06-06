//
//  XBSettingCell.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XBSettingItem;
@interface XBSettingCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

@property (nonatomic, strong) XBSettingItem *item;

@end

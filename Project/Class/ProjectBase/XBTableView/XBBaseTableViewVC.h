//
//  XBBaseTableViewVC.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBArrowSettingItem.h"
#import "XBSwtichSettingItem.h"
#import "XBSettingGroup.h"

@interface XBBaseTableViewVC : UITableViewController
// 记录当前tableView的所有数组
@property (nonatomic, strong) NSMutableArray *groups;
@end

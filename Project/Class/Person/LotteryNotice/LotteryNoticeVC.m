//
//  LotteryNoticeVC.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "LotteryNoticeVC.h"
#import "XBSettingCell.h"

@interface LotteryNoticeVC ()

@end

@implementation LotteryNoticeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addGroup0];
    self.title = @"开奖通知";
}

- (void)addGroup0
{
    
    XBSwtichSettingItem *item = [XBSwtichSettingItem itemWithImage:nil title:@"双色球"];
    item.subTitle = @"每周二、四、日开奖";
    XBSwtichSettingItem *item1 = [XBSwtichSettingItem itemWithImage:nil title:@"大乐透"];
    item1.subTitle = @"每周一、三、六开奖";
    XBSwtichSettingItem *item2 = [XBSwtichSettingItem itemWithImage:nil title:@"3D"];
    item2.subTitle = @"每天开奖、包括试机号提醒";
    XBSwtichSettingItem *item3 = [XBSwtichSettingItem itemWithImage:nil title:@"七乐彩"];
    item3.subTitle = @"每周一、三、五开奖";
    XBSwtichSettingItem *item4 = [XBSwtichSettingItem itemWithImage:nil title:@"七星彩"];
    item4.subTitle = @"每周二、五、日开奖";
    XBSwtichSettingItem *item5 = [XBSwtichSettingItem itemWithImage:nil title:@"排列3"];
    item5.subTitle = @"每天开奖";
    XBSwtichSettingItem *item6 = [XBSwtichSettingItem itemWithImage:nil title:@"排列5"];
    item6.subTitle = @"每天开奖";
    
    XBSettingGroup *group = [[XBSettingGroup alloc] init];
    group.items = @[item,item1,item2,item3,item4,item5,item6];
    
    
    [self.groups addObject:group];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    XBSettingCell *cell = [XBSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    
    // 取出哪一组
    XBSettingGroup *group = self.groups[indexPath.section];
    
    // 取出哪一行
    XBSettingItem *item = group.items[indexPath.row];
    
    // 给cell传递模型
    cell.item = item;
    
    return cell;
    
}

@end

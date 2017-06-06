//
//  XBBaseTableViewVC.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBBaseTableViewVC.h"

#import "XBSettingCell.h"

@interface XBBaseTableViewVC ()

@end

@implementation XBBaseTableViewVC

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


#pragma mark - tableView数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    XBSettingGroup *group = self.groups[section];
    
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 创建cell
    XBSettingCell *cell = [XBSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    
    // 取出哪一组
    XBSettingGroup *group = self.groups[indexPath.section];
    
    // 取出哪一行
    XBSettingItem *item = group.items[indexPath.row];
    
    // 给cell传递模型
    cell.item = item;
    
    return cell;
    
}

// 返回头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    XBSettingGroup *group = self.groups[section];
    
    return group.headTitle;
}

// 返回尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    XBSettingGroup *group = self.groups[section];
    
    return group.footTitle;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 取出哪一组
    XBSettingGroup *group = self.groups[indexPath.section];
    
    // 取出哪一行
    XBSettingItem *item = group.items[indexPath.row];
    
    if (item.itemOpertion) {
        item.itemOpertion(indexPath);
        return;
    }
    
    if ([item isKindOfClass:[XBArrowSettingItem class]]) {
        XBArrowSettingItem *arrowItem = (XBArrowSettingItem *)item;
        
        if (arrowItem.destVc) {
            // 才需要跳转
            // 创建跳转的控制器
            UIViewController *vc = [[arrowItem.destVc alloc] init];
            vc.title = item.title;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

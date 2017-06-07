//
//  LotteryHelpVC.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "LotteryHelpVC.h"

#import "XBHtmlItem.h"


#import "LotteryHelpContentVC.h"
#import "XBNavigationController.h"

@interface LotteryHelpVC ()
@property (nonatomic, strong) NSMutableArray *htmls;

@end

@implementation LotteryHelpVC

- (instancetype)init
{
    return [super initWithStyle:UITableViewStyleGrouped];
}

- (NSMutableArray *)htmls
{
    if (_htmls == nil) {
        
        _htmls = [NSMutableArray array];
        
        NSString *filePath =  [[NSBundle mainBundle] pathForResource:@"help.json" ofType:nil];
        
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        
        // 解析json
        NSArray *dictArr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        
        for (NSDictionary *dict in dictArr) {
            XBHtmlItem *item = [XBHtmlItem itemWithDict:dict];
            
            [_htmls addObject:item];
        }
        
    }
    
    return _htmls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //    OC数组：@[]  json数组：[] json字典：{}
    self.title = @"帮助中心";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.htmls.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    // 获取模型
    XBHtmlItem *item =  self.htmls[indexPath.row];
    
    cell.textLabel.text = item.title;
    
    return cell;
}

// 点击cell的时候调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 获取模型
    XBHtmlItem *item =  self.htmls[indexPath.row];
    
    // 创建展示网页的控制器
    LotteryHelpContentVC *htmlVc = [[LotteryHelpContentVC alloc] init];
    htmlVc.title = item.title;
    htmlVc.htmlItem = item;
    // modal出一个导航控制器
    XBNavigationController *nav = [[XBNavigationController alloc] initWithRootViewController:htmlVc];
    
    
    [self presentViewController:nav animated:YES completion:nil];
}


@end

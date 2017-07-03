//
//  MessageViewController.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MessageViewController.h"
#import "XBBaseTableViewCell.h"
#import "MessageWenVC.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息中心";
    self.tableView.rowHeight = 50;
    
    WS(ws);
    NSDictionary *dict = @{@"content":@"欢迎使用时时彩APP",@"time":@"时间: 2017-07-02"};
 


    [XBUITool asRequestNetWork:^{
        [ws.dataList addObject:dict];
        [ws.tableView reloadData];
    }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBBaseTableViewCell *cell = [XBBaseTableViewCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"XBBaseTableViewCell"];
    cell.imageView.image = [UIImage imageNamed:@"messageNotice"];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    NSDictionary *dict = self.dataList[indexPath.row];
    cell.textLabel.text = dict[@"content"];
    cell.detailTextLabel.text = dict[@"time"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageWenVC *webVC  =[[MessageWenVC alloc]init];
    [self.navigationController pushViewController:webVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

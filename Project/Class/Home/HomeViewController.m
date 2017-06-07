//
//  HomeViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeViewController.h"
#import "BaseWebViewController.h"

#import "XBBaseTableViewCell.h"


@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor redColor];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell*)customerSeverWithCell{
    XBBaseTableViewCell *cell = [XBBaseTableViewCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"Customer"];
    cell.textLabel.text = @"客服";
    return cell;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = @"2323";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld --- %ld",indexPath.section,indexPath.row];
    if (indexPath.row == 3) {
        cell = [self customerSeverWithCell];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    BaseWebViewController *webVC = [[BaseWebViewController alloc]init];
        webVC.webUrl = @"https://kf1.learnsaas.com/chat/chatClient/chatbox.jsp?companyID=680386&configID=64584&jid=4646761954&s=1";
    [self.navigationController pushViewController:webVC animated:YES];
//     webVC.webUrl = @"http://client.ailecp.com/user/chatInfo.htm";
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

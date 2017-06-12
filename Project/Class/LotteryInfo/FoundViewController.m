//
//  FoundViewController.m
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "FoundViewController.h"
#import "XBBaseTableViewCell.h"
#import "FoundInfoViewController.h"

@interface FoundViewController ()

@end

@implementation FoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.rowHeight = 160;
    self.requestUrl = @"http://client.ailecp.com/activity/activitySong.htm?appVersion=1&appid=108&client=ios&clientUserSession=&fetchSize=20&firstRow=0&requestServer=0&requestType=1&version=1.1.1";
}


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBBaseTableViewCell *cell = [XBBaseTableViewCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"XBBaseTableViewCell"];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, SCREEN_WIDTH - 20, 160 - 10)];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 10;
    [imageView sd_setImageWithURL:[NSURL URLWithString:self.dataList[indexPath.row]]];
    [cell.contentView addSubview:imageView];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FoundInfoViewController *infoVC = [[FoundInfoViewController alloc]init];
    [self.navigationController pushViewController:infoVC animated:YES];
    infoVC.type = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
}

- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    
    NSLog(@"%@ ----",outcome);
    [self.dataList removeAllObjects];
    for (NSDictionary *dict in outcome[@"data"]) {
        [self.dataList addObject:dict[@"img"]];
    }
    [self.tableView reloadData];
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

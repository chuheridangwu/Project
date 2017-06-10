//
//  BaseDataViewController.m
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseDataViewController.h"
#import "BaseDataTabCell.h"
#import "BaseDataEntity.h"

@interface BaseDataViewController ()

@end

@implementation BaseDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.requestUrl = self.poshUrl;
    self.tableView.tableHeaderView = [self tableViewHeardView];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}

- (UIView*)tableViewHeardView{
    BaseDataTabCell *cell = [BaseDataTabCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"BaseDataTabCell"];
    cell.isLayer = YES;
    BaseDataEntity *entity = [[BaseDataEntity alloc]init];
    entity.index = @"排名榜";
    entity.name = @"球队";
    entity.game = @"已赛";
    entity.win = @"胜";
    entity.fair = @"平";
    entity.loser = @"负";
    entity.integral = @"积分";
    cell.entity = entity;
    //    [self.dataList insertObject:entity atIndex:0];
    
    return cell;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    BaseDataTabCell *cell = [BaseDataTabCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"BaseDataTabCell"];
        BaseDataEntity *entity = [[BaseDataEntity alloc]init];
        entity.index = @"排名榜";
        entity.name = @"球队";
        entity.game = @"已赛";
        entity.win = @"胜";
        entity.fair = @"平";
        entity.loser = @"负";
        entity.integral = @"积分";
    cell.entity = entity;
    //    [self.dataList insertObject:entity atIndex:0];
    
    return cell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BaseDataTabCell *cell = [BaseDataTabCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"BaseDataTabCell"];
    cell.entity = self.dataList[indexPath.row];
    return cell;
}


- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    for (NSDictionary *dict in outcome[@"standings"][0][@"teamInfo"]) {
        BaseDataEntity *entity = [BaseDataEntity baseDataWithDict:dict];
        [self.dataList addObject:entity];
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

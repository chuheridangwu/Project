//
//  DisContentController.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "DisContentController.h"
#import "DisContentEntity.h"
#import "DisContentCell.h"

@interface DisContentController ()

@end

@implementation DisContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.requestUrl = self.url;
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DisContentCell *cell = [DisContentCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"DisContentCell"];
    DisContentEntity *entity = self.dataList[indexPath.row];
    cell.entity = entity;
    cell.textLabel.text = entity.time;
    return cell;
}



- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    
    [self.dataList removeAllObjects];
    for (NSDictionary *dict in outcome[@"data"]) {
        DisContentEntity *entity = [DisContentEntity disContentEntityWith:dict];
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

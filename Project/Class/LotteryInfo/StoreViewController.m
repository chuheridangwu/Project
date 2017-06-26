//
//  StoreViewController.m
//  Project
//
//  Created by dym on 2017/6/26.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "StoreViewController.h"
#import "StoreEntity.h"
#import "XBBaseTableViewCell.h"

@interface StoreViewController ()

@end

@implementation StoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
     self.requestUrl = @"http://mapi.yjcp.com/api/gain/tenawardinfo?lotId=33&pageNum=1&sid=31000000000";
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XBBaseTableViewCell *cell = [XBBaseTableViewCell tableViewCellInitializeWithTableView:tableView withIdtifier:@"XBBaseTableViewCell"];
    StoreEntity *entity = self.dataList[indexPath.row];
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:entity.shopIcom] placeholderImage:[UIImage imageNamed:@""]];
    cell.textLabel.text = entity.shopName;
    return cell;
}


- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"StoreList.json" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        StoreEntity *entity = [StoreEntity storeWithEntity:dict];
        [dataArray addObject:entity];
    }
    self.dataList = dataArray;
    [self.tableView reloadData];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

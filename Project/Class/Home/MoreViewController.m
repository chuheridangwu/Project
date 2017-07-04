//
//  MoreViewController.m
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "MoreViewController.h"
#import "HomeBuyLuckBallCell.h"
#import "BuyLuckBallViewController.h"


@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource,HomeBuyLuckBallCellHeight>
@property (nonatomic,strong)UITableView *tableView;

@end

@implementation MoreViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"购彩小帮手";
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.rowHeight = SCREEN_HEIGHT;
    
    
    NSString *noticion = @"  购彩小帮手助您中大奖，下注会使用iOS系统内置的Safari浏览器打开梦想彩官网，彩票开奖信息与苹果公司无关";
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - 5 - 64  - 45, SCREEN_WIDTH, 45)];
    label.text = noticion;
    label.backgroundColor = [UIColor whiteColor];
    label.textColor = [UIColor grayColor];
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeBuyLuckBallCell *cell = [HomeBuyLuckBallCell tableViewCellInitializeWithTableView:self.tableView withIdtifier:@"HomeBuyLuckBallCell"];
    cell.isMore = NO;
    cell.dataArray = self.array;
    cell.delegate  = self;
    return cell;
}

- (void)clickPushEntity:(HomeLuckBallEntity *)entity{
    BuyLuckBallViewController *ballVC = [[BuyLuckBallViewController alloc]init];
    ballVC.entity = entity;
    [self.navigationController pushViewController:ballVC animated:YES];
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

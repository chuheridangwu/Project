//
//  BaseViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseViewController.h"
#import "XBRequestModel.h"


@interface BaseViewController ()
@property (nonatomic,assign)CGFloat offsetY; //偏移量
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    
    MJRefreshNormalHeader *heard = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(tableViewDownRefresh)];
    _tableView.mj_header = heard;
    
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(tableViewPullLoading)];
    _tableView.mj_footer.hidden = YES;
    _requestModel = [[XBRequestModel alloc]init];
    _requestModel.delegate  = self;
}

- (void)setRequestUrl:(NSString *)requestUrl{
    _requestUrl = requestUrl;
    [self tableViewDownRefresh];
}

- (void)tableViewDownRefresh{
    [self.requestModel requestNetWorkURL:self.requestUrl];
}


- (void)tableViewPullLoading{
    
}

- (void)requestNetWorkSuccess:(id)outcome{
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_header endRefreshing];
}

#pragma mark - scrollView的代理方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _offsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > _offsetY) {
        [self hideTabBar];
    }else{
        [self showTabBar];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentSize.height - scrollView.contentOffset.y  <=  SCREEN_HEIGHT) {
        [self showTabBar];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}


// 显示tabbar
- (void)showTabBar
{
    [UIView animateWithDuration:0.6 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    }];
}


// 隐藏tabbar
- (void)hideTabBar {
    [UIView animateWithDuration:0.6 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);
    }];
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

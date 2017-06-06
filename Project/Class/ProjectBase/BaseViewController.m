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
@property (nonatomic,strong)UIView *noneView; //没有数据的View;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.noneView];
    [self.noneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.centerX).offset(0);
        make.centerY.equalTo(self.view.centerY).offset(-20);
        make.left.right.equalTo(0);
        make.height.equalTo(@180);
    }];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    _tableView.contentInset = UIEdgeInsetsMake(0, 0,49, 0);
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
    
    if (self.requestUrl.length == 0){
        [self requestNetWorkSuccess:nil];
        return;
    }
    
    [self.requestModel requestNetWorkURL:self.requestUrl];
}


- (void)tableViewPullLoading{
    
}

- (void)requestNetWorkSuccess:(id)outcome{
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_header endRefreshing];
    self.noneView.hidden = YES;
    _tableView.hidden = NO;
}

- (void)requestNetWorkFailure{
    [_tableView.mj_footer endRefreshing];
    [_tableView.mj_header endRefreshing];
    _noneView.hidden  = NO;
    _tableView.hidden = YES;
    
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
    [UIView animateWithDuration:0.4 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT - 49, SCREEN_WIDTH, 49);
    }];
}


// 隐藏tabbar
- (void)hideTabBar {
    [UIView animateWithDuration:0.6 animations:^{
        self.tabBarController.tabBar.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 49);
    }];
}

- (NSMutableArray*)dataList{
    if (!_dataList) {
        _dataList = [NSMutableArray array];
    }
    return _dataList;
}

- (UIView*)noneView{
    if (!_noneView) {
        _noneView = [[UIView alloc]init];
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"shopEmpty"];
        imageView.contentMode = UIViewContentModeCenter;
        [_noneView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
            make.height.equalTo(_noneView.height).multipliedBy(0.5);
        }];
        
        UILabel *label = [UILabel new];
        label.text = @"不要刷新那么快嘛!\n人家很辛苦的";
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = [UIColor grayColor];
        label.textAlignment = NSTextAlignmentCenter;
        [_noneView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(0);
            make.top.equalTo(imageView.bottom).offset(0);
        }];
    }
    return _noneView;
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

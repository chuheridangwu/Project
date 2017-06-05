//
//  BaseViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseViewController.h"



@interface BaseViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,assign)CGFloat offsetY; //偏移量
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    NSLog(@"%@ ---%f",_tableView,_tableView.scrollIndicatorInsets.top);
    
//    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.view.backgroundColor = [UIColor redColor];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"3232"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"3232"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld ----- %ld",indexPath.section,indexPath.row];
    return cell;
}

#pragma mark - scrollView的代理方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _offsetY = scrollView.contentOffset.y;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > _offsetY) {
//        [self hideNavgationBar];
        [self hideTabBar];
    }else{
        [self showTabBar];
//        [self showNavgationBar];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentSize.height - scrollView.contentOffset.y  <=  SCREEN_HEIGHT) {
        [self showTabBar];
    }
}


- (void)showNavgationBar{
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.automaticallyAdjustsScrollViewInsets = YES;
    [UIView animateWithDuration:0.8 animations:^{
//        self.navigationController.navigationBar.frame = CGRectMake(0, 0, SCREEN_WIDTH, 64);
        self.navigationController.navigationBar.hidden = NO;
    }];
}

- (void)hideNavgationBar{
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    self.automaticallyAdjustsScrollViewInsets = NO;
    [UIView animateWithDuration:0.8 animations:^{
        self.navigationController.navigationBar.hidden = YES;

//        self.navigationController.navigationBar.frame = CGRectMake(0, -64, SCREEN_WIDTH, 64);
    }];
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

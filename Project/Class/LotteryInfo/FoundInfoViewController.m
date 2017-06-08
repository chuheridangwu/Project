//
//  FoundInfoViewController.m
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "FoundInfoViewController.h"

@interface FoundInfoViewController ()
@property (nonatomic,strong)UIWebView *webView;
@end

@implementation FoundInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView removeFromSuperview];
    self.title = @"活动详情";
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.webView];
        self.requestUrl = [NSString stringWithFormat:@"http://client.ailecp.com/activity/activityDetail.htm?appVersion=4&appid=108&client=ios&clientUserSession=&requestServer=0&requestType=1&type=%@&version=1.1.1",_type];
}


- (void)requestNetWorkSuccess:(id)outcome{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:outcome[@"h5"]]]];
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

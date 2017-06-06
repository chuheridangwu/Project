//
//  DisViewController.m
//  Project
//
//  Created by dym on 2017/6/5.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "DisViewController.h"

@interface DisViewController ()

@end

@implementation DisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [XBRequestNetTool post:@"http://zx.caipiao.163.com/libraryapi/league_matchRank.html?leagueId=7&product=caipiao_client&mobileType=iphone&ver=4.33&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=67A4CF88-1A62-435A-A4F9-EE79F0D5064D" params:nil success:^(id responseObj) {
//        
//        //        NSLog(@" -------------\n  %@",responseObj);
//    } failure:^(NSError *error) {
//        
//    }];
    
    self.requestUrl = @"http://zx.caipiao.163.com/libraryapi/league_matchRank.html?leagueId=7&product=caipiao_client&mobileType=iphone&ver=4.33&channel=appstore&apiVer=1.1&apiLevel=27&deviceId=67A4CF88-1A62-435A-A4F9-EE79F0D5064D";
}


- (void)requestNetWorkSuccess:(id)outcome{
    [super requestNetWorkSuccess:outcome];
    NSLog(@"%@ ---",outcome);
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

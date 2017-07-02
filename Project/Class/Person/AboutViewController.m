
//
//  AboutViewController.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"关于我们";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Icon"]];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 5;
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.equalTo(100);
        make.centerX.offset(0);
        make.centerY.offset(-150);
    }];
    
    
    UILabel *label = [UILabel new];
    label.text = [NSString stringWithFormat:@"当前版本：%@",[XBUITool currentVersion]];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:16];
    label.textColor = [UIColor blackColor];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.equalTo(20);
        make.top.equalTo(imageView.mas_bottom).offset(10);
    }];
    
    UILabel *lable1 = [UILabel new];
    lable1.text = @" 本平台是专业的彩票论坛。为广大彩民提供技术交流/互动的平台。内含小游戏，供休闲娱乐。拒绝恶意的攻击，购彩请保持理智";
    lable1.textAlignment = NSTextAlignmentCenter;
    lable1.numberOfLines = 0;
    lable1.font = [UIFont systemFontOfSize:14];
    lable1.textColor = [UIColor grayColor];
    [self.view addSubview:lable1];
    [lable1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(10);
        make.width.equalTo(200);
        make.height.equalTo(100);
        make.centerX.offset(0);
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

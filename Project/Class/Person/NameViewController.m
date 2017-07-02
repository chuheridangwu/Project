//
//  NameViewController.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "NameViewController.h"

@interface NameViewController ()

@end

@implementation NameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"修改昵称";
    self.view.backgroundColor = RGBColor(235, 235, 235);
    
    
    
    UITextField *field = [[UITextField alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44)];
    field.borderStyle =UITextBorderStyleRoundedRect;
    [self.view addSubview:field];
    field.placeholder = @"一直大花猫";
    field.backgroundColor = [UIColor whiteColor];
    field.font = [UIFont systemFontOfSize:14];
    field.clearButtonMode = UITextFieldViewModeAlways;
    field.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 10)];

    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 70, SCREEN_WIDTH, 10)];
    label.text = @"昵称 4 ~ 10 个文字";
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;
    
    CGFloat yOffset = 180;
    CGFloat btnHeight = 40;
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(30, yOffset, SCREEN_WIDTH-2*30, btnHeight);
    [submitBtn setBackgroundColor:XBAPPBaseColor];
    [submitBtn setBorderRadian:6.0 width:0.1 color:XBAPPBaseColor];
    [submitBtn setTitle:@"保存昵称" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
    
}

- (void)submit{
    [XBUITool asRequestNetWork:^{
        [XBUITool showRmindView:@"保存成功"];
        [self.navigationController popViewControllerAnimated:YES];
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

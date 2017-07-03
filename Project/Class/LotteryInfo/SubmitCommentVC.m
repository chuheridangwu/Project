//
//  SubmitCommentVC.m
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "SubmitCommentVC.h"

@interface SubmitCommentVC ()

@end

@implementation SubmitCommentVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"提交评论";
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = RGBColor(235, 235, 235);
    
    
    
    UITextView *field = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    [self.view addSubview:field];
    field.backgroundColor = [UIColor whiteColor];
    field.font = [UIFont systemFontOfSize:14];
    
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 130, SCREEN_WIDTH, 10)];
    label.text = @"评论最多0 ~ 120个字";
    label.textColor = [UIColor grayColor];
    [self.view addSubview:label];
    label.font = [UIFont systemFontOfSize:12];
    label.textAlignment = NSTextAlignmentLeft;
    
    CGFloat yOffset = 220;
    CGFloat btnHeight = 40;
    UIButton *submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    submitBtn.frame = CGRectMake(30, yOffset, SCREEN_WIDTH-2*30, btnHeight);
    [submitBtn setBackgroundColor:XBAPPBaseColor];
    [submitBtn setBorderRadian:6.0 width:0.1 color:XBAPPBaseColor];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [submitBtn addTarget:self action:@selector(submit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:submitBtn];
}

- (void)submit{
    [XBUITool asRequestNetWork:^{
        [XBUITool showRmindView:@"评论成功"];
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

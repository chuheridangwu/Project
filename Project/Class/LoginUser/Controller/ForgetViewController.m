//
//  ForgetViewController.m
//  ManMao
//
//  Created by 周智勇 on 16/3/2.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "ForgetViewController.h"

@interface ForgetViewController ()
@property (weak, nonatomic) IBOutlet UIButton *ensureBtn;

@property (weak, nonatomic) IBOutlet UITextField *yanzhengmaTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (weak, nonatomic) IBOutlet UITextField *ensurePassTF;
@property (weak, nonatomic) IBOutlet UITextField *telTF;
@property (weak, nonatomic) IBOutlet UIButton *sendYanZhengBtn;

@property (nonatomic, copy)NSString * sagaId;
@end

@implementation ForgetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"重置密码";
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.ensureBtn.layer.cornerRadius = 3;
    self.sendYanZhengBtn.layer.cornerRadius = 3;
    self.passWordTF.secureTextEntry = YES;
    self.ensurePassTF.secureTextEntry = YES;
    self.passWordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.ensurePassTF.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (IBAction)sendYanZhengMa:(UIButton *)sender {
    if ([self checkTel]) {
         [XBUITool showRmindView:@"验证码发送成功"];
    }
}

- (IBAction)ensureBtnClicked:(UIButton *)sender {
    if ([self checkUserInfo]) {
        NSString * netPath = @"regist_updpwd";
        NSMutableDictionary * allParams = [NSMutableDictionary dictionary];
        [allParams setObject:self.telTF.text forKey:@"mobile"];
        [allParams setObject:self.passWordTF.text forKey:@"newPassword"];
        [allParams setObject:self.ensurePassTF.text forKey:@"repeatPassword"];
        [allParams setObject:self.yanzhengmaTF.text forKey:@"smsValidCode"];
        if (self.sagaId == nil) {
            [XBUITool showRmindView:@"验证码有误"];

            return;
        }
    }
}

- (BOOL)checkUserInfo{//其实在这里后台会判断的，但是由于要请求网络，判断有延迟，所以自己加了判断
    if (![self.passWordTF.text isEqualToString: self.ensurePassTF.text]) {
        [XBUITool showRmindView:@"两次密码不一致"];

        return 0;
    }
    if (self.passWordTF.text.length == 0) {
        [XBUITool showRmindView:@"请输入密码"];

        return 0;
    }
    if (!(self.passWordTF.text.length >= 8 && self.passWordTF.text.length <=30)) {
        [XBUITool showRmindView:@"密码长度应为8-30个字符"];

        return 0;
    }
    if (self.telTF.text.length == 0) {
        [XBUITool showRmindView:@"请输入正确的手机号"];
        return 0;
    }
    if (self.yanzhengmaTF.text.length == 0) {
        [XBUITool showRmindView:@"验证码不能为空"];

        return 0;
    }
    return 1;
}

- (BOOL)checkTel{
    if (self.telTF.text.length == 0) {
        [XBUITool showRmindView:@"请输入正确的手机号"];
        return 0;
    }
    if (self.telTF.text.length != 11) {
        [XBUITool showRmindView:@"请输入正确的手机号"];
        return 0;
    }
    return 1;
}

#pragma mark -- 发送验证码倒计时
- (void)startResidualTimer {
    self.sendYanZhengBtn.userInteractionEnabled = NO;
//    self.sendYanZhengBtn.layer.cornerRadius = 5;
    self.sendYanZhengBtn.layer.masksToBounds = YES;
    self.sendYanZhengBtn.backgroundColor = [UIColor lightGrayColor];
    __block int timeout=60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                self.sendYanZhengBtn.userInteractionEnabled = YES;
                self.sendYanZhengBtn.backgroundColor = RGBColor(216,161,41);
                [self.sendYanZhengBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
//                self.code = @"验证超时";
            });
        }else{
            int seconds = timeout ;
            NSString *strTime = [NSString stringWithFormat:@"%zd秒后重新验证", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self.sendYanZhengBtn setTitle:strTime forState:UIControlStateNormal];
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


@end

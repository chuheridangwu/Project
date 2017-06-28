//
//  AccountViewController.m
//  ManMao
//
//  Created by dym on 17/2/7.
//  Copyright © 2017年 Tuse. All rights reserved.
//

#import "AccountViewController.h"
#import "NSString+Helper.h"

@interface AccountViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneText;
@property (weak, nonatomic) IBOutlet UITextField *valdtionText;
@property (weak, nonatomic) IBOutlet UIButton *VerCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@property (nonatomic, assign) NSInteger index;
@property (nonatomic,strong)NSString *sagaId;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *photoTextTopMargin;

@end

@implementation AccountViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"绑定账号";
    self.view.backgroundColor = RGBColor(240, 241, 242);
    self.valdtionText.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.phoneText.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.sureBtn setBorderRadian:5 width:1 color:[UIColor clearColor]];
    [self.VerCodeBtn setBorderRadian:5 width:1 color:[UIColor clearColor]];
    self.index = 60;
}

//检验手机号
- (IBAction)VerificationCodeBtn:(id)sender {
    if ( ![NSString isMobileNumber:self.phoneText.text]) {
        [XBUITool showRmindView:@"请输入正确的手机号"];
        return;
    }
    [self sendVerifCode];
    [XBUITool showRmindView:@"成功获取验证码"];

}

- (void)sendVerifCode{
    self.VerCodeBtn.enabled = NO;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(clickTime:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
}

- (void)clickTime:(NSTimer*)timer{
    self.index --;
    [self.VerCodeBtn setTitle:[NSString stringWithFormat:@"（%02lds）后重新申请",self.index]forState:UIControlStateNormal];
    if (self.index <= 0) {
        [self.VerCodeBtn setTitle:@"重新申请" forState:UIControlStateNormal];
        self.VerCodeBtn.enabled = YES;
        self.index = 60;
        [timer invalidate];
        timer = nil;
    }
}


//确定
- (IBAction)determineBtn:(id)sender {
    if ( ![NSString isMobileNumber:self.phoneText.text]) {
        [XBUITool showRmindView:@"请输入正确的手机号"];
        return;
    }
    if (self.valdtionText.text.length == 0) {
        [XBUITool showRmindView:@"验证码不能为空"];
        return ;
    }
    
    [self.view endEditing:YES];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [XBUITool showRmindView:@"注册成功"];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end

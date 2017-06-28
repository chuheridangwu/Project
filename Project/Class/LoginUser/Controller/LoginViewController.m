//
//  LoginViewController.m
//  ManMao
//
//  Created by 周智勇 on 16/2/25.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistViewController.h"
#import "AccountViewController.h"
#import "ForgetViewController.h"


@interface LoginViewController ()<AccountViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *hiyuanBtn;
@property (weak, nonatomic) IBOutlet UIButton *dailiBtn;
@property (weak, nonatomic) IBOutlet UITextField *telTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIView *topBackView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (nonatomic, strong)UIButton * saveBtn;
@property (nonatomic,copy)NSString * type;

@property (nonatomic, copy)NSString * canRegister;

@property (nonatomic,copy)NSString *isVipCenter;

@property (nonatomic,assign)BOOL isLogin;
@end

@implementation LoginViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:@"LoginViewController" bundle:nil]) {
        self.view.width = SCREEN_WIDTH;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"登录";
    self.passWordTextField.secureTextEntry = YES;
    self.passWordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.telTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self configerSubViews];
    [self showHistoryData];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"Main_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(clickNavLeftBack)];
      [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLogin:) name:@"WXAuthorization" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(WXUserLoginSuccend:) name:@"WXUserLoginSuccess" object:nil];
}

- (void)userLogin:(NSNotification*)tion{
    AccountViewController *vc = [[AccountViewController alloc]init];
    vc.delegate = self;
    vc.openID = tion.userInfo[@"openId"];
    vc.token = tion.userInfo[@"token"];
    vc.isNewUser = [tion.userInfo[@"isUser"] boolValue];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)WXUserLoginSuccend:(NSNotification*)tion{

}

// 返回上层控制器
- (void)clickNavLeftBack{
    if (self.returnType) {
        if (self.userBlock && self.isLogin != YES) {
            self.userBlock();
        }
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}



- (void)showHistoryData{
 
}

- (void)configerSubViews{
    self.loginBtn.layer.cornerRadius = 5;
    self.topBackView.layer.borderWidth = 1;
    self.topBackView.layer.borderColor = RGBColor(215,160,40).CGColor;
    
    self.hiyuanBtn.tag = 1000;//普通用户
    self.dailiBtn.tag = 1001;//代理
    
    self.backView.layer.borderWidth = 1;
    self.backView.layer.borderColor = RGBColor(235, 235, 235).CGColor;
}



- (void)loginDisMissViewController:(loginBlock)block{
    self.userBlock = block;
}


- (IBAction)zhuceClicked:(UIButton *)sender {
    RegistViewController * registerVC = [[RegistViewController alloc] init];
    [self.telTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
    [self.navigationController pushViewController:registerVC animated:YES];
    
}
/**
 *  忘记密码
 */
- (IBAction)forgetPassWord:(UIButton *)sender {
    [self.telTextField resignFirstResponder];
    [self.passWordTextField resignFirstResponder];
    ForgetViewController * forgetVC = [[ForgetViewController alloc] init];
    [self.navigationController pushViewController:forgetVC animated:YES];
}
/**
 *  登录按钮
 */
- (IBAction)login:(UIButton *)sender {
    
    if ([self checkUserInfo] && [self.telTextField.text isEqualToString:@"13688886666"] && [self.passWordTextField.text isEqualToString:@"123456"]) {
        [XBUITool showRmindView:@"验证码发送成功"];

        [self dismissViewControllerAnimated:YES completion:nil];
        if (self.myBlock) {
            self.myBlock();
        }
    }else{
        [XBUITool showRmindView:@"请输入正确的账号密码"];
    }
    
}


#pragma mark -- 检测输入的内容
- (BOOL)checkUserInfo{//其实在这里后台会判断的，但是由于要请求网络，判断有延迟，所以自己加了判断
    if (self.telTextField.text.length == 0) {
        [self shakeButton];
        [XBUITool showRmindView:@"用户名不能为空"];
        return 0;
    }
    if (self.passWordTextField.text.length == 0) {
        [self shakeButton];
        [XBUITool showRmindView:@"密码不能为空"];
        return 0;
    }
    return 1;
}

#pragma mark Animations
- (void)shakeButton
{
    CAKeyframeAnimation *keyFrame = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    keyFrame.values = @[@(self.loginBtn.layer.position.x - 10), @(self.loginBtn.layer.position.x),@(self.loginBtn.layer.position.x + 10), @(self.loginBtn.layer.position.x)];
    keyFrame.repeatCount = 5;
    keyFrame.duration = 0.05;
    [self.loginBtn.layer addAnimation:keyFrame forKey:nil];
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}




@end

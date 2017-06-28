//
//  RegistViewController.m
//  ManMao
//
//  Created by 周智勇 on 16/2/26.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "RegistViewController.h"
#import "NSString+Helper.h"

@interface RegistViewController ()
@property (weak, nonatomic) IBOutlet UITextField *TelTextField;
@property (weak, nonatomic) IBOutlet UIButton *duanxinBtn;

@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.TelTextField.layer.cornerRadius = 3;
    self.TelTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.duanxinBtn.layer.cornerRadius = 3;
    self.title = @"注册";
    self.view.backgroundColor = RGBColor(241, 241, 241);
    self.duanxinBtn.userInteractionEnabled = YES;
}


/**
 *  获取验证码
 */
- (IBAction)huoquBtnClicked:(UIButton *)sender {

    if ([NSString isMobileNumber:self.TelTextField.text]) {
        self.duanxinBtn.userInteractionEnabled = NO;
        [XBUITool showRmindView:@"手机号已注册"];
    }
}

- (BOOL)judgeTelNum{
    NSString * regex = @"[0-9]{11}";
    NSPredicate * pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    if ([pred evaluateWithObject:self.TelTextField.text]) {
        return YES;
    }else{
        return NO;
    }
}




@end

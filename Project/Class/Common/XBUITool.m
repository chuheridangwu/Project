//
//  XBUITool.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBUITool.h"
#import "XBNavigationController.h"
#import "XBTabBarController.h"

@implementation XBUITool
//设置弹框
+ (void)showRmindView:(NSString*)text{
    UILabel *label  =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 220, 35)];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.center = [UIApplication sharedApplication].keyWindow.center;
    label.backgroundColor = XBAPPBaseColor;
    label.alpha = 0;
    [[UIApplication sharedApplication].keyWindow addSubview:label];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 5;
    [UIView animateWithDuration:1.0 animations:^{
        label.alpha = 1;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:2.0 animations:^{
            label.alpha = 0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

+(NSString*)currentVersion{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

+ (void)asRequestNetWork:(void(^)())success{
    [XBRequestNetTool post:@"http://mapi.yjcp.com/api/gain/tenawardinfo?lotId=33&pageNum=1&sid=31000000000" params:nil success:^(id responseObj) {
        sleep(0.1);
        success();
    } failure:^(NSError *error) {
        
    }];
}

@end

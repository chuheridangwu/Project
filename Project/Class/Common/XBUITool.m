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
+ (void)showTabbar{
    for (UIViewController *vcs in [UIApplication sharedApplication].windows) {
        NSLog(@"%@  ------- \nkeyWindow  ---%@",vcs,[UIApplication sharedApplication].keyWindow);
    }
}

+ (void)hideTabbar{
    
}


@end

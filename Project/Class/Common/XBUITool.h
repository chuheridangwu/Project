//
//  XBUITool.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XBUITool : NSObject
//提醒视图
+ (void)showRmindView:(NSString*)text;
//当前系统版本号
+(NSString*)currentVersion;

@end

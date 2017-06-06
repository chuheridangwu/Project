//
//  XBSettingItem.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBSettingItem : NSObject

@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *subTitle;

// 用来保存每一行cell的功能
@property (nonatomic, strong) void(^itemOpertion)(NSIndexPath *indexPath);


+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;

@end

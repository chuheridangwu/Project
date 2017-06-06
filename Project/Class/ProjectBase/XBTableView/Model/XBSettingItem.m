//
//  XBSettingItem.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBSettingItem.h"

@implementation XBSettingItem
+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title
{
    XBSettingItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}

@end

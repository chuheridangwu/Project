//
//  XBSettingGroup.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBSettingGroup.h"

@implementation XBSettingGroup
+ (instancetype)groupWithItems:(NSArray *)items
{
    XBSettingGroup *group = [[self alloc] init];
    
    group.items = items;
    
    return group;
}
@end

//
//  DIscoverItem.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "DIscoverItem.h"

@implementation DIscoverItem
+ (instancetype)disCoverItemWithDict:(NSDictionary*)dict{
    DIscoverItem *item = [[DIscoverItem alloc]init];
    item.title = dict[@"title"];
    item.url = dict[@"api_url"];
    return item;
}
@end

//
//  XBHtmlItem.m
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "XBHtmlItem.h"

@implementation XBHtmlItem
+ (instancetype)itemWithDict:(NSDictionary *)dict
{
    XBHtmlItem *item = [[XBHtmlItem alloc]init];
    item.title = dict[@"title"];
    item.ID = dict[@"id"];
    item.html = dict[@"html"];
    return item;
}
@end

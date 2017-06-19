
//
//  FoundEntity.m
//  Project
//
//  Created by dym on 2017/6/19.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "FoundEntity.h"

@implementation FoundEntity
+ (instancetype)foundEntityWithDic:(NSDictionary *)dict{
    FoundEntity *entity = [[FoundEntity alloc]init];
    entity.title = dict[@""];
    entity.imgUrl = dict[@"image"];
    entity.descir = dict[@"expertabstract"];
    entity.webUrl = dict[@"url"];
    return entity;
}
@end

//
//  HomeDataEntity.m
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeDataEntity.h"

@implementation HomeDataEntity

+ (instancetype)homeDataEntityWithDict:(NSDictionary*)dict{
    HomeDataEntity *entity = [[HomeDataEntity alloc]init];
    entity.icon = dict[@"logo"];
    entity.name = dict[@"cardName"];
    entity.cardDesc = dict[@"cardDesc"];
    entity.jumpUrl = dict[@"jumpUrl"];
    entity.isPush = dict[@"isPush"];
    return entity;
}

@end

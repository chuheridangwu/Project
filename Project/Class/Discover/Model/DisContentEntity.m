//
//  DisContentEntity.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "DisContentEntity.h"

@implementation DisContentEntity
+ (instancetype)disContentEntityWith:(NSDictionary *)dict{
    DisContentEntity *Entity = [[DisContentEntity alloc]init];
    Entity.time = dict[@"opentime"];
    Entity.count = dict[@"expect"];
    Entity.luckNumber = [dict[@"opencode"] componentsSeparatedByString:@","];
    return Entity;
}
@end

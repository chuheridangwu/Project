//
//  FoundInfoEntity.m
//  Project
//
//  Created by dym on 2017/6/20.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "FoundInfoEntity.h"

@implementation FoundInfoEntity
+ (instancetype)foundInfoEntityWith:(NSDictionary*)dict{
    FoundInfoEntity *entity = [[FoundInfoEntity alloc]init];
    entity.title = dict[@"title"];
    entity.subTitle = dict[@"subTitle"];
    entity.content = dict[@"content"];
    entity.publishTime = dict[@"publishTime"];
    entity.picUrl = dict[@"picUrl"];

    return entity;
}
@end

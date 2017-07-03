//
//  CommentEntity.m
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "CommentEntity.h"

@implementation CommentEntity

+ (instancetype)commentEntityWithDict:(NSDictionary *)dict{
    CommentEntity *entity = [[CommentEntity alloc]init];
    NSDictionary *dic = dict[@"poster"];
    entity.name = dic[@"name"];
    entity.iconName = dic[@"avatar"];
    entity.content = dict[@"content"];
    entity.dateline = dict[@"dateline"];

    return entity;
}

@end





//
//  BaseDataEntity.m
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseDataEntity.h"

@implementation BaseDataEntity

+ (instancetype)baseDataWithDict:(NSDictionary*)dict{
    BaseDataEntity *entity = [[BaseDataEntity alloc]init];
    entity.index = dict[@"rank"];
    entity.name = dict[@"team"];
    entity.game = dict[@"matchesPlayed"];
    entity.win = dict[@"wins"];
    entity.loser = dict[@"losses"];
    entity.fair = dict[@"draws"];
    entity.integral = dict[@"points"];

    return entity;
}
@end

//
//  HomeLuckBallEntity.m
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeLuckBallEntity.h"

@implementation HomeLuckBallEntity
+ (instancetype)homeLuckBallEnittyWithDic:(NSDictionary*)dic{
    HomeLuckBallEntity *entity = [[HomeLuckBallEntity alloc]init];
    entity.name = dic[@"name"];
    entity.iconName = dic[@"icon"];
    entity.max = [dic[@"max"] intValue];
    entity.min = [dic[@"min"] intValue];
    entity.leaveArray = dic[@"leave"];
    entity.jumpURL = dic[@"jumpUrl"];
    return entity;
}
- (NSMutableArray*)selearray{
    if (!_selearray) {
        _selearray = [NSMutableArray array];
        for (int i = 0; i < 6; i++) {
            [_selearray addObject:@"-1"];
        }
    }
    return _selearray;
}

@end

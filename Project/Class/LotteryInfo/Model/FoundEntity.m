
//
//  FoundEntity.m
//  Project
//
//  Created by dym on 2017/6/19.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "FoundEntity.h"
#import "FoundInfoEntity.h"

@implementation FoundEntity
+ (instancetype)foundEntityWithDic:(NSDictionary *)dict{
    FoundEntity *entity = [[FoundEntity alloc]init];
    entity.homeLogo = dict[@"homeLogo"];
    entity.homeName = dict[@"homeName"];
    entity.awayLogo = dict[@"awayLogo"];
    entity.awayName = dict[@"awayName"];
    entity.leagueName = dict[@"leagueName"];
    NSMutableArray *array = [NSMutableArray array];
    for (NSDictionary*infoDict in dict[@"tips"]) {
        FoundInfoEntity *infoEntity = [FoundInfoEntity foundInfoEntityWith:infoDict];
        [array addObject:infoEntity];
    }
    entity.tipsArray = array;
    return entity;
}

- (NSArray*)tipsArray{
    if (!_tipsArray) {
        _tipsArray = [NSArray array];
    }
    return _tipsArray;
}
@end

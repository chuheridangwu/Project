//
//  StoreEntity.m
//  Project
//
//  Created by dym on 2017/6/26.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "StoreEntity.h"

@implementation StoreEntity
+ (instancetype)storeWithEntity:(NSDictionary *)dict{
    StoreEntity *entity = [[StoreEntity alloc]init];
    entity.shopIcom = dict[@"avatar"];
    entity.shopName = dict[@"name"];
    entity.starArray = dict[@"evaluate"];
    entity.paySuccess = dict[@"salesStatusText"];
    return entity;
}
@end

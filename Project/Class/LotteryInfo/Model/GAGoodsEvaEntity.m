//
//  GAGoodsEvaEntity.m
//  ManMao
//
//  Created by dym on 16/11/22.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "GAGoodsEvaEntity.h"

@implementation GAGoodsEvaEntity
+ (GAGoodsEvaEntity*)GAGoodsEvaEntityWithDic:(NSDictionary*)dic{
    GAGoodsEvaEntity *entity = [[GAGoodsEvaEntity alloc]init];
    entity.title = dic[@"topicInfo"][@"subject"];
    entity.sendTime = dic[@"topicInfo"][@"dateline"];
    entity.shop = [ShopEntity ShopEntityWithDic:dic[@"topicInfo"][@"poster"]];
    entity.imgs = dic[@"topicInfo"][@"images"];
    return entity;
}

- (NSArray*)imgs{
    if (!_imgs) {
        _imgs = [NSArray array];
    }
    return _imgs;
}
@end


@implementation ShopEntity
+ (ShopEntity*)ShopEntityWithDic:(NSDictionary*)dic{
    ShopEntity *entity = [[ShopEntity alloc]init];
    entity.shopIcom = dic[@"avatar"];
    entity.shopName = dic[@"name"];
    entity.level = arc4random()%6;
    entity.level = entity.level > 2 ? entity.level : entity.level + 3;
    NSArray *array = @[@"9:00 ~ 14:00",@"7:00 ~ 19:00",@"8:40 ~ 19:00",@"8:00 ~ 24:00",@"10:00 ~ 22:00",@"9:00 ~ 19:00",@"7:00 ~ 16:00",@"7:30 ~ 19:00",@"8:20 ~ 22:00",@"9:00 ~ 21:00",@"8:00 ~ 14:00"];
    entity.time = array[arc4random()%11];
    entity.iconArray = @[@"logo_任9场",@"logo_江西时时彩",@"logo_北京单场",@"logo_福彩3D",@"logo_江西时时彩",@"logo_江西时时彩",@"logo_广西快3",@"logo_贵州11选5",@"logo_贵州11选5",@"logo_贵州11选5",@"logo_快乐十分",@"logo_快乐十分",@"logo_快乐十分"];
    entity.nameArray = @[@"任9场",@"江西时时彩",@"北京单场",@"福彩3D",@"江西时时彩",@"江西时时彩",@"广西快3",@"贵州11选5",@"贵州11选5",@"贵州11选5",@"快乐十分",@"快乐十分",@"快乐十分"];
    
    return entity;
}


- (NSMutableArray*)luckArray{
    if (!_luckArray) {
        _luckArray = [NSMutableArray array];
    }
    return _luckArray;
}

@end

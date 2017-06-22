//
//  GAGoodsEvaEntity.h
//  ManMao
//
//  Created by dym on 16/11/22.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ShopEntity;
@interface GAGoodsEvaEntity : NSObject
@property (nonatomic,copy)NSString *sendTime; //发送时间
@property (nonatomic,copy)NSString *title;
@property (nonatomic,strong)NSArray *imgs;
@property (nonatomic,strong)ShopEntity *shop;

+ (GAGoodsEvaEntity*)GAGoodsEvaEntityWithDic:(NSDictionary*)dic;
@end


@interface ShopEntity : NSObject
@property (nonatomic,copy)NSString *shopName;
@property (nonatomic,copy)NSString *shopIcom;
@property (nonatomic,assign)NSInteger level;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *type;
@property (nonatomic,strong)NSMutableArray *luckArray;
+ (ShopEntity*)ShopEntityWithDic:(NSDictionary*)dic;
@end

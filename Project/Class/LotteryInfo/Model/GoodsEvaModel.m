//
//  GoodsEvaModel.m
//  ManMao
//
//  Created by dym on 16/11/22.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "GoodsEvaModel.h"
#import "GAGoodsEvaEntity.h"

@interface GoodsEvaModel ()
{
    NSMutableArray *_evaArrar;
}
@end

@implementation GoodsEvaModel

- (instancetype)init{
    if (self = [super init]) {
        _evaArrar = [NSMutableArray array];
    }
    return self;
}



- (void)lookGoodsEvaluationShopLive{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ShopLive.json" ofType:@""];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dict in array) {
        GAGoodsEvaEntity *entity = [GAGoodsEvaEntity GAGoodsEvaEntityWithDic:dict];
        [_evaArrar addObject:entity];
    }
    
    [self requestnetWorkSucceed];
    
}

- (void)requestnetWorkSucceed{
    if ([self.delegate respondsToSelector:@selector(GoodsEvaModelRequestNetWorkSucceed)]) {
        [self.delegate GoodsEvaModelRequestNetWorkSucceed];
    }
}
@end

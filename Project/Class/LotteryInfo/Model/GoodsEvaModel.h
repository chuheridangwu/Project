//
//  GoodsEvaModel.h
//  ManMao
//
//  Created by dym on 16/11/22.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GoodsEvaModelDelegate;
@interface GoodsEvaModel : NSObject
@property (nonatomic,strong)NSArray *evaArrar;
@property (nonatomic,weak)id<GoodsEvaModelDelegate> delegate;
- (void)lookGoodsEvaluationShopLive;
@end

@protocol GoodsEvaModelDelegate <NSObject>
- (void)GoodsEvaModelRequestNetWorkSucceed;
@end

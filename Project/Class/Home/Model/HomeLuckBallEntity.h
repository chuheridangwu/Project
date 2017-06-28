//
//  HomeLuckBallEntity.h
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeLuckBallEntity : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *iconName;
@property (nonatomic,assign)NSInteger max;
@property (nonatomic,assign)NSInteger min;
@property (nonatomic,copy)NSString *jumpURL;

@property (nonatomic,strong)NSArray *leaveArray;
@property (nonatomic,strong)NSMutableArray *selearray;

+ (instancetype)homeLuckBallEnittyWithDic:(NSDictionary*)dic;
@end

//
//  HomeDataEntity.h
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeDataEntity : NSObject
@property (nonatomic,strong)NSString *name;
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *cardDesc;
@property (nonatomic,strong)NSString *jumpUrl;

+ (instancetype)homeDataEntityWithDict:(NSDictionary*)dict;
@end

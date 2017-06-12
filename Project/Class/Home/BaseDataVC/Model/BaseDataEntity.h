//
//  BaseDataEntity.h
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseDataEntity : NSObject
@property (nonatomic,copy)NSString *index;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *game;
@property (nonatomic,copy)NSString *win;
@property (nonatomic,copy)NSString *loser;

@property (nonatomic,copy)NSString *fair;
@property (nonatomic,copy)NSString *integral;

+ (instancetype)baseDataWithDict:(NSDictionary*)dict;
@end

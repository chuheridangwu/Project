//
//  DisContentEntity.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisContentEntity : NSObject
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *count;
@property (nonatomic,strong)NSArray *luckNumber;
+ (instancetype)disContentEntityWith:(NSDictionary*)dict;


@end

//
//  FoundInfoEntity.h
//  Project
//
//  Created by dym on 2017/6/20.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundInfoEntity : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *publishTime;
@property (nonatomic,copy)NSString *picUrl;

+ (instancetype)foundInfoEntityWith:(NSDictionary*)dict;
@end

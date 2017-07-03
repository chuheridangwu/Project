//
//  CommentEntity.h
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentEntity : NSObject
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *dateline;
@property (nonatomic, copy) NSString *iconName;

+ (instancetype)commentEntityWithDict:(NSDictionary*)dict;
@end



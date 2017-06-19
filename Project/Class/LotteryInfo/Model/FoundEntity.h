//
//  FoundEntity.h
//  Project
//
//  Created by dym on 2017/6/19.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundEntity : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *imgUrl;
@property (nonatomic,copy)NSString *webUrl;
@property (nonatomic,copy)NSString *descir;
+ (instancetype)foundEntityWithDic:(NSDictionary*)dict;
@end

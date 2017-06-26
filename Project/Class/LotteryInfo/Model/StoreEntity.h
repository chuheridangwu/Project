//
//  StoreEntity.h
//  Project
//
//  Created by dym on 2017/6/26.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoreEntity : NSObject
@property (nonatomic,copy)NSString *shopName;
@property (nonatomic,copy)NSString *shopIcom;
@property (nonatomic,strong)NSArray *starArray;
@property (nonatomic,copy)NSString *paySuccess;

+ (instancetype)storeWithEntity:(NSDictionary*)dict;
@end

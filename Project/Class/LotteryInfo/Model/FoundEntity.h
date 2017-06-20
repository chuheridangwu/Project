//
//  FoundEntity.h
//  Project
//
//  Created by dym on 2017/6/19.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoundEntity : NSObject
@property (nonatomic,copy)NSString *homeLogo;
@property (nonatomic,copy)NSString *awayLogo;
@property (nonatomic,copy)NSString *homeName;
@property (nonatomic,copy)NSString *awayName;
@property (nonatomic,copy)NSString *leagueName;
@property (nonatomic,strong)NSArray *tipsArray;
+ (instancetype)foundEntityWithDic:(NSDictionary*)dict;
@end

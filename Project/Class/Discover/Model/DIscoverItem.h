//
//  DIscoverItem.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DIscoverItem : NSObject
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *url;
+ (instancetype)disCoverItemWithDict:(NSDictionary*)dict;
@end

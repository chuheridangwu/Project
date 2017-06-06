//
//  XBSettingGroup.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBSettingGroup : NSObject
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, strong) NSString *headTitle;

@property (nonatomic, strong) NSString *footTitle;

+ (instancetype)groupWithItems:(NSArray *)items;

@end

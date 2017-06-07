//
//  XBHtmlItem.h
//  Project
//
//  Created by dym on 2017/6/7.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBHtmlItem : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *html;

@property (nonatomic, strong) NSString *ID;

+ (instancetype)itemWithDict:(NSDictionary *)dict;

@end

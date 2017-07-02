//
//  UIColor+WX.h
//  Woxin2.0
//
//  Created by le ting on 7/15/14.
//  Copyright (c) 2014 le ting. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
#define WXColorWithInteger(i)	[UIColor colorWithRGB:i]
@interface UIColor (WX)

+ (UIColor*)colorWithRGB:(NSInteger)rgb;
+ (UIColor*)colorWithRGB:(NSInteger)rgb alpha:(CGFloat)alpha;
+ (UIColor*)colrWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b;
+ (UIColor*)colrWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexString:(NSString *)color;
@end

//
//  UIColor+Color.h
//  Project
//
//  Created by 董玉毛 on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBColor(r,g,b) RGBAColor(r,g,b,1.0)
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface UIColor (Color)

+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

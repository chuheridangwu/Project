//
//  UIColor+WX.m
//  Woxin2.0
//
//  Created by le ting on 7/15/14.
//  Copyright (c) 2014 le ting. All rights reserved.
//

#import "UIColor+WX.h"

@implementation UIColor (WX)

+ (UIColor*)colorWithRGB:(NSInteger)rgb{
	return [self colorWithRGB:rgb alpha:1.0];
}

+ (UIColor*)colorWithRGB:(NSInteger)rgb alpha:(CGFloat)alpha{
	NSInteger b = rgb%0x100;
	NSInteger g = (rgb%0x10000)/0x100;
	NSInteger r = rgb/0x10000;
	return [self colrWithR:r g:g b:b alpha:alpha];
}

+ (UIColor*)colrWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b
{
	return [self colorWithRed:r green:g blue:b alpha:1.0];
}

+ (UIColor*)colrWithR:(NSInteger)r g:(NSInteger)g b:(NSInteger)b alpha:(CGFloat)alpha{
	CGFloat red = r;
	CGFloat green = g;
	CGFloat blue = b;
	return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}

//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}

@end

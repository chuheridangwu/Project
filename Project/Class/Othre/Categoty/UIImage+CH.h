//
//  UIImage+CH.h
//  新闻
//
//  Created by Think_lion on 15/5/4.
//  Copyright (c) 2015年 Think_lion. All rights reserved.
//

#import <UIKit/UIKit.h>
#define ImageScale 0.2
#define LogoImageMargin 5

@interface UIImage (CH)
+(UIImage *)resizedImage:(NSString *)name;
+(UIImage *)resizedImage:(NSString *)name left:(CGFloat)left top:(CGFloat)top;


//截屏方法
+(instancetype)renderView:(UIView *)renderView;
//图片家水印
+(instancetype)waterWithBgName:(NSString *)bg waterLogo:(NSString *)water;
//裁剪图片为园
+(instancetype)clipWithImageName:(NSString*)name bordersW:(CGFloat)bordersW borderColor:(UIColor *)borderColor;
//设置图片的背景颜色
+ (UIImage *)imageWithColor:(UIColor *)color;


//将图片压缩至需要的大小 -- 相册图片选取
- (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize;

@end

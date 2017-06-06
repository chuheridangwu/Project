//
//  UIImage+image.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)
// 快速的返回一个最原始的图片
+ (instancetype)imageWithOriRenderingImage:(NSString *)imageName;
// 快速拉伸图片
+ (instancetype)imageWithStretchableImageName:(NSString *)imageName;
@end

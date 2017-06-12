//
//  UIView+Render.h
//  Project
//
//  Created by dym on 2017/6/12.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Render)

- (void)setBorderRadian:(CGFloat)radian width:(CGFloat)width color:(UIColor*)color;
- (void)toRound;
- (void)toRoundViewBorder:(CGFloat)borderWidth borderColor:(UIColor*)color;
@end

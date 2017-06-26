//
//  UIButton+XBAlignment.m
//  Pods
//
//  Created by jiangliancheng on 16/4/8.
//
//

#import "UIButton+XBAlignment.h"

@implementation UIButton (XBAlignment)


- (void)buttonImageTitleAlignment:(imageTitleAlignment)aligment WithSpace:(float)space {
    switch (aligment) {
        case leftImageRightTitle:
        {
            [self XB_imageTitleHorizontalAlignmentWithSpace:space];
        }
            break;
        case leftTitleRightImage:
        {
            [self XB_titleImageHorizontalAlignmentWithSpace:space];
        }
            break;
        case topImageBottomTitle:
        {
            [self XB_imageTitleVerticalAlignmentWithSpace:space];
        }
            break;
        case topTitleBottomImage:
        {
            [self XB_titleImageVerticalAlignmentWithSpace:space];
        }
            break;
    }
}


- (void)XB_titleImageHorizontalAlignmentWithSpace:(float)space;
{
    [self XB_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];

    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)];
    [self setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width+space, 0, -titleSize.width - space)];
}

- (void)XB_imageTitleHorizontalAlignmentWithSpace:(float)space;
{
    [self XB_resetEdgeInsets];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(0, space, 0, -space)];
    [self setContentEdgeInsets:UIEdgeInsetsMake(0, 0, 0, space)];
}

- (void)XB_titleImageVerticalAlignmentWithSpace:(float)space;
{
    [self XB_verticalAlignmentWithTitleTop:YES space:space];
}

- (void)XB_imageTitleVerticalAlignmentWithSpace:(float)space;
{
    [self XB_verticalAlignmentWithTitleTop:NO space:space];
}

- (void)XB_verticalAlignmentWithTitleTop:(BOOL)isTop space:(float)space ;
{
    [self XB_resetEdgeInsets];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    
    CGRect contentRect = [self contentRectForBounds:self.bounds];
    CGSize titleSize = [self titleRectForContentRect:contentRect].size;
    CGSize imageSize = [self imageRectForContentRect:contentRect].size;
    
    float halfWidth = (titleSize.width + imageSize.width)/2;
    float halfHeight = (titleSize.height + imageSize.height)/2;
    
    float topInset = MIN(halfHeight, titleSize.height);
    float leftInset = (titleSize.width - imageSize.width)>0?(titleSize.width - imageSize.width)/2:0;
    float bottomInset = (titleSize.height - imageSize.height)>0?(titleSize.height - imageSize.height)/2:0;
    float rightInset = MIN(halfWidth, titleSize.width);
    
    if (isTop) {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(-halfHeight-space, - halfWidth, halfHeight+space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(topInset+space, leftInset, -bottomInset, -rightInset)];
    } else {
        [self setTitleEdgeInsets:UIEdgeInsetsMake(halfHeight+space, - halfWidth, -halfHeight-space, halfWidth)];
        [self setContentEdgeInsets:UIEdgeInsetsMake(-bottomInset, leftInset, topInset+space, -rightInset)];
    }
}

- (void)XB_resetEdgeInsets
{
    [self setContentEdgeInsets:UIEdgeInsetsZero];
    [self setImageEdgeInsets:UIEdgeInsetsZero];
    [self setTitleEdgeInsets:UIEdgeInsetsZero];
}

@end

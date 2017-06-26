//
//  UIButton+LCAlignment.h
//  Pods
//
//  Created by jiangliancheng on 16/4/8.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, imageTitleAlignment) {
    leftImageRightTitle,
    leftTitleRightImage,
    topImageBottomTitle,
    topTitleBottomImage
};


@interface UIButton (LCAlignment)

/**
 *  展示图片和文字的不同位置
 *
 *  @param aligment 位置参数
 *  @param space    图文的间距
 */
- (void)buttonImageTitleAlignment:(imageTitleAlignment)aligment WithSpace:(float)space;

@end

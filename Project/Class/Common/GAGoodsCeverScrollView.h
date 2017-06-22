//
//  GAGoodsCeverScrollView.h
//  ManMao
//
//  Created by dym on 16/11/23.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    GAGoodsImgsStyle_ImgURL,  //需要尽情网络请求
    GAGoodsImgsStyle_ImgPath  //本地图片
}GAGoodsImgsStyle;

@interface GAGoodsCeverScrollView : UIView
+ (void)hiddenImageViewFrame:(CGRect)frame imgs:(NSArray*)imgs index:(NSInteger)index ImgStyle:(GAGoodsImgsStyle)style;
@end

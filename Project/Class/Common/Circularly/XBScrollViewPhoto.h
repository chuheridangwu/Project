//
//  XBScrollViewPhoto.h
//  ScrollPhoto
//
//  Created by dym on 16/12/16.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void((^phototBlock)) (NSInteger clickIndex);

@interface XBScrollViewPhoto : UIView

//图片被点击会调用block
@property (nonatomic,copy)phototBlock clickIndexBlcok;

//占位图片
@property (nonatomic,strong) UIImage *placeImage;

//default is 2.0f,如果小于0.5不自动播放
@property (nonatomic,assign) NSTimeInterval AutoScrollDelay;

//PageControl的颜色
@property (nonatomic,strong) UIColor *pageIndicatorTintColor;

//PageControl当前选中的page颜色
@property (nonatomic,strong) UIColor *currentPageIndicatorTintColor;

/*
 1.frame:自身的frame
 2.imgsArray: 图片数组,不限制图片是网络图片还是本地图片
 3.photoIndex: 图片被点击的下标,从0开始
 */
+ (instancetype)scrollViewPhotoWithFrame:(CGRect)frame ImgsArray:(NSArray*)imgsArray clickPhontIndex:(phototBlock)photoIndex;
@end

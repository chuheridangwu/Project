//
//  DidView.m
//  LittleGame
//
//  Created by dym on 17/1/4.
//  Copyright © 2017年 wewq. All rights reserved.
//

#import "DidView.h"

@interface DidView ()
@property (nonatomic,strong)UIView *didView;
@property (nonatomic,assign)int index;
@end

@implementation DidView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 0, 100, self.frame.size.height)];
        imgView.image = [UIImage imageNamed:@"bg_life.png"];
        [self addSubview:imgView];
        
        self.didView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, imgView.frame.size.width - 20, imgView.frame.size.height - 5)];
        [imgView addSubview:self.didView];
   
        
        UIImageView *rightImgView = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width - 100, 0, 100, self.frame.size.height)];
        rightImgView.image = [UIImage imageNamed:@"pc_hero.png"];
        rightImgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:rightImgView];
        
        self.index = 4;
        [self didViewReductionLiveImg];
    }
    return self;
}

//减一个爱心图片
- (void)didViewReductionLiveImg{
    [self.didView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    self.index --;
    CGFloat margin = 10;
    CGFloat imgWidth = (self.didView.frame.size.width - margin * 2) / 3;
    for (int i = 0; i < self.index; i++) {
        CGFloat imgX = margin + (imgWidth) * i;
        UIImageView *liveImg = [[UIImageView alloc]initWithFrame:CGRectMake(imgX, 0, imgWidth, imgWidth)];
        liveImg.image = [UIImage imageNamed:@"pc_life.png"];
        [self.didView addSubview:liveImg];
    }
}

@end

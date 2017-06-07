//
//  ContentView.h
//  LittleGame
//
//  Created by dym on 16/11/10.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContentViewDelegate;
@interface ContentView : UIView
@property (nonatomic,weak)id<ContentViewDelegate> delegate;
@property (nonatomic,strong)UIImage *bgImg;

- (void)setCententVackImg:(UIImage*)image;
@end

@protocol ContentViewDelegate <NSObject>
//没有造成连选
- (void)clickErrorMessage;

//成功通关
- (void)successfulCustomsClearance;
@end

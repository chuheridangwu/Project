//
//  XBTabBar.h
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol XBTabBarDelegate;

@interface XBTabBar : UIView
// 模型数组(UITabBarItem)
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, weak) id<XBTabBarDelegate> delegate;
@end

@protocol XBTabBarDelegate <NSObject>
@optional
- (void)tabBar:(XBTabBar *)tabBar didClickBtn:(NSInteger)index;

@end

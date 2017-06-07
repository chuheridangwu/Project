//
//  ContentView.h
//  LittleGame
//
//  Created by dym on 16/11/7.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottonViewDelegate;
@interface BottonView : UIView
@property (nonatomic,weak)id<BottonViewDelegate> delegate;
@end

@protocol BottonViewDelegate <NSObject>
- (void)clickContentViewErrorMessage:(NSString*)time;

- (void)clickContentSuccessfulCustomsClearance:(NSString*)time;
@end

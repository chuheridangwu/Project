//
//  ContinueView.h
//  LittleGame
//
//  Created by dym on 17/1/6.
//  Copyright © 2017年 wewq. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ClickBlock) ();

@interface ContinueView : UIView
@property (nonatomic,copy)ClickBlock clickNextBlock;
- (void)setContinueViewTime:(NSString*)time WithImgName:(NSString*)imgName NextBtn:(ClickBlock)Nextbtn;
@end

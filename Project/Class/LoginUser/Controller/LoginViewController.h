//
//  LoginViewController.h
//  ManMao
//
//  Created by 周智勇 on 16/2/25.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UserLoginSucceedNotificationCenter   @"UserLoginSucceedNotificationCenter"

typedef void(^loginBlock)();

@protocol LoginViewControllerDelegate ;
@interface LoginViewController : UIViewController
@property (nonatomic,weak)id <LoginViewControllerDelegate> delegate;
@property (nonatomic, copy)void (^myBlock)();
@property (nonatomic, assign)BOOL  returnType;  //设置跳转方式 push or  dismiss
@property (nonatomic,copy)loginBlock userBlock;

- (void)loginDisMissViewController:(loginBlock)block;
@end


@protocol LoginViewControllerDelegate <NSObject>
- (void)userLoginSuccend;
@end

//
//  AccountViewController.h
//  ManMao
//
//  Created by dym on 17/2/7.
//  Copyright © 2017年 Tuse. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AccountViewControllerDelegate;
@interface AccountViewController : UIViewController
@property (nonatomic,weak)id<AccountViewControllerDelegate> delegate;
@property (nonatomic,strong)NSString *openID;
@property (nonatomic,strong)NSString *token;
@property (nonatomic,assign)BOOL isNewUser; //YSE为未查到用户
@end

@protocol AccountViewControllerDelegate <NSObject>
- (void)accountViewControllerUserLoginSucceed:(NSDictionary*)dict;
@end

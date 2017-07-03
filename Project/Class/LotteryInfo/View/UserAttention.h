//
//  UserAttention.h
//  Beauty
//
//  Created by app on 15/12/16.
//  Copyright (c) 2015年 roderick. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    UserCollectType_Shop = 0,
    UserCollectType_Store,
    UserCollectType_Stylist,
}UserCollectType;

@class UserAttention;
@protocol UserAttentionDelegate <NSObject>
- (void)userAttentionClick:(UserAttention*)atten clickTag:(UserCollectType)clickTag;
@end

@interface UserAttention : UIView
@property (nonatomic,weak)id <UserAttentionDelegate> delegate;
@end

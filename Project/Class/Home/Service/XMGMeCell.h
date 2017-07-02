//
//  XMGMeCell.h
//  07-聊天布局
//
//  Created by xiaomage on 15/6/6.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XMGMessage;

@interface XMGMeCell : UITableViewCell
@property (nonatomic, strong) XMGMessage *message;
@end

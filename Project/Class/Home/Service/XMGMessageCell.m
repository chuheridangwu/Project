//
//  XMGMessageCell.m
//  07-聊天布局
//
//  Created by xiaomage on 15/6/5.
//  Copyright (c) 2015年 xiaomage. All rights reserved.
//

#import "XMGMessageCell.h"
#import "XMGMessage.h"
//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

@interface XMGMessageCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@end

@implementation XMGMessageCell


- (void)awakeFromNib
{
    self.textButton.titleLabel.numberOfLines = 0;
}

- (void)setMessage:(XMGMessage *)message
{
    _message = message;
    
    // 时间处理
    if (message.hideTime) { // 隐藏时间
        self.timeLabel.hidden = YES;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(0);
        }];
    } else { // 显示时间
        self.timeLabel.text = message.time;
        self.timeLabel.hidden = NO;
        [self.timeLabel updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(21);
        }];
    }
    
    // 处理显示的消息文字
    // 设置按钮的文字
    [self.textButton setTitle:self.message.text forState:UIControlStateNormal];
    
    // 强制更新
    [self layoutIfNeeded];
    
    // 设置按钮的高度就是titleLabel的高度
    [self.textButton updateConstraints:^(MASConstraintMaker *make) {
        CGFloat buttonH = self.textButton.titleLabel.frame.size.height + 30;
        make.height.equalTo(buttonH);
    }];
    
    // 强制更新
    [self layoutIfNeeded];
    
    // 计算当前cell的高度
    CGFloat buttonMaxY = CGRectGetMaxY(self.textButton.frame);
    CGFloat iconMaxY = CGRectGetMaxY(self.iconView.frame);
    self.message.cellHeight = MAX(buttonMaxY, iconMaxY) + 10;
}
@end

//
//  HomeSectionListCell.m
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeSectionListCell.h"

@implementation HomeSectionListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        CGFloat width = SCREEN_WIDTH / 3;
        for (int i = 0; i < 3; i ++) {
            UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(i * width, 0, SCREEN_WIDTH, self.mj_h)];
            [self.contentView addSubview:btn];
            btn.titleLabel.text = @"1";
            btn.titleLabel.textColor = [UIColor redColor];
            [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchDown];
            btn.tag = i;
        }
    }
    return self;
}

- (void)clickBtn:(NSInteger)button{
    
}

@end

//
//  HomeSectionTitleCell.m
//  Project
//
//  Created by dym on 2017/6/8.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeSectionTitleCell.h"

@interface HomeSectionTitleCell (){
    UIView *conteView;
}
@property (nonatomic,strong)UILabel *titleL;
@end

@implementation HomeSectionTitleCell

- (void)setSectionTitle:(NSString *)title{
    self.mj_w = SCREEN_WIDTH;
    self.mj_h = HomeSectionTitleCellHeight;
    [conteView removeFromSuperview];
    conteView = [[UIView alloc]initWithFrame:self.bounds];
    conteView.backgroundColor = RGBColor(243, 243, 243);
    [self.contentView addSubview:conteView];
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 8, 8)];
    leftView.layer.masksToBounds = YES;
    leftView.layer.cornerRadius = leftView.mj_w / 2;
    leftView.backgroundColor = XBAPPBaseColor;
    leftView.center = CGPointMake(10, self.mj_h / 2);
    leftView.alpha = 0.7;
    [conteView addSubview:leftView];
    
    [conteView addSubview:self.titleL];
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftView.mas_right).offset(10);
        make.right.bottom.top.offset(0);
    }];
    
    _titleL.text = title;
}


- (UILabel*)titleL{
    if (!_titleL) {
        _titleL = [UILabel new];
        _titleL.textColor = [UIColor grayColor];
        _titleL.font = [UIFont systemFontOfSize:14];
    }
    return _titleL;
}

@end

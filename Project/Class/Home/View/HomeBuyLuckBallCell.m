//
//  BuyLuckBallCell.m
//  Project
//
//  Created by dym on 2017/6/27.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "HomeBuyLuckBallCell.h"
#import "HomeLuckBallEntity.h"

@implementation HomeBuyLuckBallCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.contentView.mj_h = HomeBuyLuckBallCellHeigth;
        self.mj_w = SCREEN_WIDTH;
        
        
        
    }
    return self;
}

- (void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    
    NSInteger count = 4;
    CGFloat margin = 10;
    CGFloat marginHeight = 5;
    CGFloat width = (self.contentView.frame.size.width - (count + 1) * margin) / count;
    CGFloat height = (self.contentView.frame.size.height - marginHeight * (dataArray.count % 4 + 1 ) ) / 2;
    for (int i = 0; i < dataArray.count; i++) {
        HomeLuckBallEntity  *eneity = dataArray[i];
        NSInteger row = i % count;
        NSInteger low = i / count;
        CGFloat x = margin + (margin + width) * row;
        CGFloat y = marginHeight +(marginHeight + height) * low;
        UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [self.contentView addSubview:backView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, height * 0.7, width, height - height * 0.7)];
        label.font = [UIFont systemFontOfSize:11];
        label.text = eneity.name;
        label.textAlignment = NSTextAlignmentCenter;
        [backView addSubview:label];
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectZero];
        [imgView setImage:[UIImage imageNamed:eneity.iconName]];
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.userInteractionEnabled = YES;
        [backView addSubview:imgView];
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(5);
            make.right.equalTo(- 5);
            make.bottom.equalTo(label.top).offset(-5);
        }];
        
        UIButton *btn = [[UIButton alloc]initWithFrame:backView.bounds];
        btn.backgroundColor = [UIColor clearColor];
        btn.tag = i;
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        [backView addSubview:btn];
        
        //            backView.backgroundColor = [UIColor redColor];
        //            imgView.backgroundColor = [UIColor yellowColor];
        //            label.backgroundColor = [UIColor blueColor];
    }
    
}

- (void)clickBtn:(UIButton *)btn{
    HomeLuckBallEntity *entity = _dataArray[btn.tag];
    [self.delegate clickPushEntity:entity];
}

@end

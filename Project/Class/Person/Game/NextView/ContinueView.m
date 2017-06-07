//
//  ContinueView.m
//  LittleGame
//
//  Created by dym on 17/1/6.
//  Copyright © 2017年 wewq. All rights reserved.
//

#import "ContinueView.h"

@interface ContinueView ()
@property (nonatomic,strong)UILabel *timeL;
@property (nonatomic,strong)UIImageView *imgView;
@end

@implementation ContinueView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        bgImg.userInteractionEnabled = YES;
        [self addSubview:bgImg];
        bgImg.image = [UIImage imageNamed:@"bg_end"];
        [bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        UILabel *titleL = [UILabel new];
        titleL.text = @"GAME OVER";
        titleL.font = [UIFont systemFontOfSize:40];
        titleL.textAlignment = NSTextAlignmentCenter;
        [bgImg addSubview:titleL];
        [titleL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(40);
            make.top.equalTo(90);
        }];
        
        [bgImg addSubview:self.timeL];
        [self.timeL  mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(40);
            make.top.equalTo(titleL.bottom).offset(20);
        }];
        
        self.imgView = [UIImageView new];
        self.imgView.image = [UIImage imageNamed:@"pc_end_good"];
        self.imgView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgImg.centerX).offset(@0);
            make.width.equalTo(bgImg.width).multipliedBy(0.6);
            make.top.equalTo(self.timeL.bottom).offset(20);
            make.height.equalTo(self.imgView.width).multipliedBy(1);
        }];

        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"NEXT" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(clickNextBtn) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:25];
        [bgImg addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(bgImg.centerX).offset(0);
            make.width.equalTo(100);
            make.height.equalTo(40);
            make.top.equalTo(self.imgView.bottom).offset(20);
        }];


//        titleL.backgroundColor = [UIColor yellowColor];
//        self.timeL.backgroundColor = [UIColor redColor];
//        self.imgView.backgroundColor = [UIColor blueColor];
//        btn.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setContinueViewTime:(NSString*)time WithImgName:(NSString*)imgName NextBtn:(ClickBlock)Nextbtn{
    self.timeL.text = [NSString stringWithFormat:@"Time:%@",time];
    self.imgView.image = [UIImage imageNamed:imgName];
    self.clickNextBlock = Nextbtn;
}

- (void)clickNextBtn{
    self.clickNextBlock();
}


- (UILabel*)timeL{
    if (!_timeL) {
        _timeL = [UILabel new];
        _timeL.font = [UIFont systemFontOfSize:25];
        _timeL.textAlignment = NSTextAlignmentCenter;
    }
    return _timeL;
}

@end

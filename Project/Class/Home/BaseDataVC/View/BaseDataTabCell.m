//
//  BaseDataTabCell.m
//  Project
//
//  Created by 董玉毛 on 2017/6/10.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BaseDataTabCell.h"
#import "BaseDataEntity.h"

@interface BaseDataTabCell ()
@property (nonatomic,strong)UILabel *indexL;
@property (nonatomic,strong)UILabel *nameL;
@property (nonatomic,strong)UILabel *gameL;
@property (nonatomic,strong)UILabel *winL;
@property (nonatomic,strong)UILabel *fairL;
@property (nonatomic,strong)UILabel *losserL;
@property (nonatomic,strong)UILabel *integralL;

@property (nonatomic,strong)UILabel *indexNewL;

@end

@implementation BaseDataTabCell



- (void)setEntity:(BaseDataEntity *)entity{
    _entity = entity;
    self.mj_w = SCREEN_WIDTH;
    [self.bottonView removeFromSuperview];
    self.bottonView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.contentView addSubview:self.bottonView];
    [self.bottonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    [self.bottonView addSubview:self.indexL];
    [self.bottonView addSubview:self.nameL];
    [self.bottonView addSubview:self.gameL];
    [self.bottonView addSubview:self.winL];
    [self.bottonView addSubview:self.fairL];
    [self.bottonView addSubview:self.losserL];
    [self.bottonView addSubview:self.integralL];
    [self.indexL addSubview:self.indexNewL];
    
    self.bottonView.frame = self.bounds;
    
    [_indexL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.height.width.equalTo(50);
        make.centerY.offset(0);
    }];
    
    [_indexNewL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.equalTo(20);
        make.center.offset(0);
    }];
    
    [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(_indexL.right).offset(0);
        make.width.equalTo(80);
    }];
    
    [_integralL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.offset(0);
        make.width.equalTo(50);
    }];
    
    [_gameL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(_nameL.right).offset(0);
        make.width.equalTo(_winL.mas_width).multipliedBy(1);
        make.width.equalTo(_fairL.mas_width).multipliedBy(1);
        make.width.equalTo(_losserL.mas_width).multipliedBy(1);

    }];
    
    
    [_winL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(_gameL.right).offset(0);
//        make.width.equalTo(_gameL.mas_width).multipliedBy(1);
    }];
    
  
    
    [_fairL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(_winL.right).offset(0);
//        make.width.equalTo(_losserL.mas_width).multipliedBy(1);
    }];
    
    [_losserL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.equalTo(_fairL.right).offset(0);
        make.right.equalTo(_integralL.left).offset(0);
    }];
    
    
//    entity.index = @"排名榜";
//    entity.name = @"球队";
//    entity.game = @"已赛";
//    entity.win = @"胜";
//    entity.fair = @"平";
//    entity.loser = @"负";
//    entity.integral = @"积分";
//    _fairL.backgroundColor = [UIColor redColor];
//    _losserL.backgroundColor = [UIColor yellowColor];
//    _winL.backgroundColor = [UIColor blueColor];
//    _integralL.backgroundColor = [UIColor grayColor];
//    _nameL.backgroundColor = [UIColor greenColor];
//    _indexL.backgroundColor = [UIColor redColor];
//    _fairL.backgroundColor = [UIColor redColor];

    
    if (self.isLayer) {
        self.indexNewL.hidden = YES;
         self.indexL.text = entity.index;
    }else{
         self.indexL.text = @"";
        self.indexNewL.hidden = NO;
        self.indexNewL.text = entity.index;
    }
   
    self.nameL.text = entity.name;
    self.gameL.text = entity.game;
    self.winL.text = entity.win;
    self.fairL.text = entity.fair;
    self.losserL.text = entity.loser;
    self.integralL.text = entity.integral;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    if (!self.isLayer) {
        _indexNewL.layer.masksToBounds = YES;
        _indexNewL.layer.cornerRadius = _indexNewL.mj_w / 2;
    }

}

- (UILabel*)indexL{
    if (!_indexL) {
        _indexL = [UILabel new];
        _indexL.font = [UIFont systemFontOfSize:13];
        _indexL.textColor = [UIColor blackColor];
        _indexL.textAlignment = NSTextAlignmentCenter;

    }
    return _indexL;
}

- (UILabel*)nameL{
    if (!_nameL) {
        _nameL = [UILabel new];
        _nameL.font = [UIFont systemFontOfSize:13];
        _nameL.textColor = [UIColor blackColor];
        _nameL.textAlignment = NSTextAlignmentCenter;
    }
    return _nameL;
}
- (UILabel*)gameL{
    if (!_gameL) {
        _gameL = [UILabel new];
        _gameL.font = [UIFont systemFontOfSize:13];
        _gameL.textColor = [UIColor blackColor];
        _gameL.textAlignment = NSTextAlignmentCenter;
    }
    return _gameL;
}

- (UILabel*)winL{
    if (!_winL) {
        _winL = [UILabel new];
        _winL.font = [UIFont systemFontOfSize:13];
        _winL.textColor = [UIColor blackColor];
        _winL.textAlignment = NSTextAlignmentCenter;
    }
    return _winL;
}

- (UILabel*)fairL{
    if (!_fairL) {
        _fairL = [UILabel new];
        _fairL.font = [UIFont systemFontOfSize:13];
        _fairL.textColor = [UIColor blackColor];
        _fairL.textAlignment = NSTextAlignmentCenter;
    }
    return _fairL;
}

- (UILabel*)losserL{
    if (!_losserL) {
        _losserL = [UILabel new];
        _losserL.font = [UIFont systemFontOfSize:13];
        _losserL.textColor = [UIColor blackColor];
        _losserL.textAlignment = NSTextAlignmentCenter;
    }
    return _losserL;
}

- (UILabel*)integralL{
    if (!_integralL) {
        _integralL = [UILabel new];
        _integralL.font = [UIFont systemFontOfSize:13];
        _integralL.textColor = [UIColor blackColor];
        _integralL.textAlignment = NSTextAlignmentCenter;
    }
    return _integralL;
}

- (UILabel*)indexNewL{
    if (!_indexNewL) {
        _indexNewL = [UILabel new];
        _indexNewL.font = [UIFont systemFontOfSize:13];
        _indexNewL.textColor = [UIColor whiteColor];
        _indexNewL.textAlignment = NSTextAlignmentCenter;
        _indexNewL.backgroundColor = XBAPPBaseColor;
    }
    return _indexNewL;
}

@end

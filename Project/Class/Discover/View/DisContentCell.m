//
//  DisContentCell.m
//  Project
//
//  Created by dym on 2017/6/6.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "DisContentCell.h"
#import "DisContentEntity.h"

@interface DisContentCell ()
@property (nonatomic,strong)UILabel *timeL;
@property (nonatomic,strong)UILabel *countL;
@property (nonatomic,strong)UIView *didView;
@property (nonatomic,strong)UIView *backView;

@end

@implementation DisContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.backView];
        [self.backView addSubview:self.timeL];
        [self.backView addSubview:self.countL];
        [self.backView addSubview:self.didView];
        
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
            make.bottom.right.offset(-10);
        }];
        
        [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(5);
            make.left.offset(5);
            make.right.offset(-0);
            make.bottom.equalTo(self.countL.top).offset(-5);
        }];
        
        [self.countL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(5);
            make.right.offset(-0);
            make.bottom.equalTo(self.didView.top).offset(-5);
        }];
        
        [self.didView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.equalTo(self.backView.bottom).offset(-5);
        }];
        
    }
    return self;
}

- (void)setEntity:(DisContentEntity *)entity{
    _entity = entity;
    _timeL.text = [NSString stringWithFormat:@"开奖期号: %@",entity.count];
    _countL.text = [NSString stringWithFormat:@"开奖时间：%@",entity.time];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    int count = (int)self.entity.luckNumber.count;
    CGFloat margin = 5;
    
    NSArray *colorArray = @[RGBColor(83, 134, 176),RGBColor(199, 66, 81),RGBColor(67, 165, 149)];
    CGFloat width = (SCREEN_WIDTH - 20 - (margin * (count + 1))) / count;
    for (int i = 0; i < _entity.luckNumber.count; i++) {
        CGFloat offsetx = margin + (width + margin) * i;
        UILabel *luckNumL = [[UILabel alloc]initWithFrame:CGRectMake(offsetx, 0, width, _didView.frame.size.height)];
        [_didView addSubview:luckNumL];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake((luckNumL.mj_w - luckNumL.mj_h) / 2, 0, luckNumL.mj_h, luckNumL.mj_h)];
        label.text = _entity.luckNumber[i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:18];
        label.layer.masksToBounds = YES;
        label.layer.cornerRadius = luckNumL.mj_h / 2;
        [luckNumL addSubview:label];
        label.backgroundColor = colorArray[arc4random()%colorArray.count];
    }
}



- (UILabel*)timeL{
    if (!_timeL) {
        _timeL = [[UILabel alloc]initWithFrame:CGRectZero];
        _timeL.textAlignment = NSTextAlignmentLeft;
        _timeL.font= [UIFont fontWithName:@"zapfino"size:14];
        _timeL.textColor = [UIColor blackColor];
    }
    return _timeL;
}

- (UILabel*)countL{
    if (!_countL) {
        _countL = [[UILabel alloc]initWithFrame:CGRectZero];
        _countL.textAlignment = NSTextAlignmentLeft;
        _countL.font = [UIFont systemFontOfSize:18];
        _countL.textColor = [UIColor blackColor];
    }
    return _countL;
}


- (UIView*)didView{
    if (!_didView) {
        _didView = [[UIView alloc]initWithFrame:CGRectZero];
    }
    return _didView;
}

- (UIView*)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectZero];
        _backView.backgroundColor = RGBColor(240, 229, 196);
        _backView.layer.masksToBounds = YES;
        _backView.layer.cornerRadius = 10;
    }
    return _backView;
}
@end

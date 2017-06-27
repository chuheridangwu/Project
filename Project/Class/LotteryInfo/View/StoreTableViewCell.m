//
//  StoreTableViewCell.m
//  Project
//
//  Created by dym on 2017/6/27.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "StoreTableViewCell.h"
#import "StoreEntity.h"

@interface StoreTableViewCell ()
@property (nonatomic,strong)UIImageView *iconImg;
@property (nonatomic,strong)UIButton *followBtn;
@property (nonatomic,strong)UILabel *shopName;
@property (nonatomic,strong)UIView *starView;
@end

@implementation StoreTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.mj_h =  StoreTableViewCellHeight;
        self.mj_w = SCREEN_WIDTH;
        
        [self.contentView addSubview:self.iconImg];
        [self.contentView addSubview:self.shopName];
        [self.contentView addSubview:self.followBtn];
        [self.contentView addSubview:self.starView];
        
        _iconImg.frame = CGRectMake(10, 5, self.mj_h - 10, self.mj_h - 10);
        _shopName.frame = CGRectMake(self.mj_h + 10, 5,self.mj_w - self.mj_h, _iconImg.mj_h / 2);
        _followBtn.frame = CGRectMake(self.mj_w - 70, CGRectGetMaxY(_shopName.frame) + 5, 60, _iconImg.mj_h / 2 - 10);
        _starView.frame = CGRectMake(self.mj_h + 10 , CGRectGetMaxY(_shopName.frame), self.mj_w - 70 - self.mj_h - 10, _iconImg.mj_h / 2);

//        self.starView.backgroundColor = [UIColor redColor];
    }
    return self;
}

- (void)setEntity:(StoreEntity *)entity{
    _entity = entity;
    [_iconImg sd_setImageWithURL:[NSURL URLWithString:entity.shopIcom] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    _shopName.text = entity.shopName;

    [self.starView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < entity.starArray.count; i++) {
        UIImageView *levImgView = [[UIImageView alloc]initWithFrame:CGRectMake((15 + 6) * i, (self.starView.mj_h - 15) / 2, 15 ,15)];
        levImgView.image = [UIImage imageNamed:@"grade"];
        [self.starView addSubview:levImgView];
    }
}

- (void)location{
    [self.delegate getLocation];
}


- (UILabel*)shopName{
    if (!_shopName) {
        _shopName = [UILabel new];
        _shopName.textColor = RGBColor(81, 81, 81);
        _shopName.textAlignment = NSTextAlignmentLeft;
        _shopName.font = [UIFont systemFontOfSize:14];
        _shopName.numberOfLines = 0;
    }
    return _shopName;
}

- (UIImageView*)iconImg{
    if (!_iconImg) {
        _iconImg = [UIImageView new];
    }
    return _iconImg;
}

- (UIView*)starView{
    if (!_starView) {
        _starView = [UIView new];
    }
    return _starView;
}

- (UIButton *)followBtn{
    if (!_followBtn) {
        _followBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _followBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_followBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_followBtn setTitle:@"带我去" forState:UIControlStateNormal];
        _followBtn.backgroundColor = XBAPPBaseColor;
        [_followBtn addTarget:self action:@selector(location) forControlEvents:UIControlEventTouchDown];
        _followBtn.layer.masksToBounds = YES;
        _followBtn.layer.cornerRadius = 5;
    }
    return _followBtn;
}


@end

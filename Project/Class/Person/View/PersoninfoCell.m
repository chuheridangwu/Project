//
//  PersoninfoCell.m
//  Project
//
//  Created by 董玉毛 on 2017/6/18.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "PersoninfoCell.h"

@interface PersoninfoCell ()
@property (nonatomic,strong)UILabel *nameL;
@property (nonatomic,strong)UILabel *userID;
@property (nonatomic,strong)UILabel *phoneL;
@property (nonatomic,strong)UIButton *imgView;
@property (nonatomic,strong)UIImageView *leavenImg;

@end

@implementation PersoninfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.width = SCREEN_WIDTH;
        self.height = PersoninfoCellHeight;
        self.backgroundColor = XBAPPBaseColor;
        
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.nameL];
        [self.contentView addSubview:self.userID];
        [self.contentView addSubview:self.phoneL];
        [self.contentView addSubview:self.leavenImg];
        
        
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(15);
            make.centerY.equalTo(self.contentView.centerY).offset(0);
            make.width.height.equalTo(60);
        }];
        
        [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imgView.mas_right).offset(15);
            make.right.offset(-5);
            make.top.equalTo(_imgView.mas_top).offset(5);
            make.height.equalTo(25);
        }];
        
        [_userID mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_imgView.mas_right).offset(15);
            make.right.offset(-5);
            make.top.equalTo(_nameL.mas_bottom).offset(5);
            make.height.equalTo(20);
        }];
        
        
//        _imgView.backgroundColor = [UIColor redColor];
//        _userID.backgroundColor = [UIColor yellowColor];
//        _nameL.backgroundColor = [UIColor blueColor];
//        _phoneL.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)clickUserImg{
    [self.delegate clickImgView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.contentView setNeedsLayout];
    [self.contentView layoutIfNeeded];
    
    self.imgView.layer.masksToBounds = YES;
    self.imgView.layer.cornerRadius = self.imgView.mj_w / 2;
}

- (UIButton*)imgView{
    if (!_imgView) {
        _imgView = [[UIButton alloc]init];
        [_imgView setBackgroundImage:[UIImage imageNamed:@"timg"] forState:UIControlStateNormal];
        _imgView.userInteractionEnabled = YES;
        [_imgView addTarget:self action:@selector(clickUserImg) forControlEvents:UIControlEventTouchDown];
    }
    return _imgView;
}

- (UILabel*)nameL{
    if (!_nameL) {
        _nameL = [[UILabel alloc]init];
        _nameL.textAlignment = NSTextAlignmentLeft;
        _nameL.font = [UIFont systemFontOfSize:14];
        _nameL.textColor = [UIColor whiteColor];
        _nameL.text = @"一直大花猫";
    }
    return _nameL;
}

- (UILabel*)userID{
    if (!_userID) {
        _userID = [[UILabel alloc]init];
        _userID.textAlignment = NSTextAlignmentLeft;
        _userID.font = [UIFont systemFontOfSize:14];
        _userID.textColor = [UIColor whiteColor];
_userID.text = @"ID: 1102233";
    }
    return _userID;
}

- (UILabel*)phoneL{
    if (!_phoneL) {
        _phoneL = [[UILabel alloc]init];
        _phoneL.textAlignment = NSTextAlignmentLeft;
        _phoneL.font = [UIFont systemFontOfSize:14];
        _phoneL.textColor = [UIColor whiteColor];
        _phoneL.text = @"手机号码：136XXXX6666";
    }
    return _phoneL;
}


- (UIImageView*)leavenImg{
    if (!_leavenImg) {
        _leavenImg = [[UIImageView alloc]init];
        _leavenImg.userInteractionEnabled = YES;
    }
    return _leavenImg;
}



@end

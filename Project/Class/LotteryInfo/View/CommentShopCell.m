//
//  CommentShopCell.m
//  Project
//
//  Created by dym on 2017/7/3.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "CommentShopCell.h"
#import "CommentEntity.h"


#define  ContentLabelFont   [UIFont systemFontOfSize:14]

@interface CommentShopCell ()
@property (nonatomic,strong)UIImageView *iconImg;
@property (nonatomic,strong)UILabel *phoneL;
@property (nonatomic,strong)UILabel *timeL;
@property (nonatomic,strong)UILabel *contentL;
@property (nonatomic,strong)UIView *imgsView;

@property (nonatomic,strong)UIView *didView;
@end

@implementation CommentShopCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconImg];
        [self.contentView addSubview:self.phoneL];
        [self.contentView addSubview:self.timeL];
        [self.contentView addSubview:self.contentL];
        [self.contentView addSubview:self.imgsView];
        
        CGFloat leftMargin = 10;
        
        //        self.iconImg.backgroundColor = [UIColor redColor];
        //        self.phoneL.backgroundColor = [UIColor yellowColor];
        //        self.timeL.backgroundColor = [UIColor blueColor];
        
        _iconImg.layer.masksToBounds = YES;
        _iconImg.layer.cornerRadius = 20;
        
        [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(10);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        
        [self.phoneL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImg.mas_right).offset(10);
            make.top.equalTo(10);
            make.right.offset(-10);
            make.height.equalTo(20);
        }];
        
        [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImg.mas_right).offset(10);
            make.top.equalTo(self.phoneL.mas_bottom).offset(0);
            make.right.equalTo(-10);
            make.height.equalTo(20);
        }];
        
        [self.contentL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImg.mas_bottom).offset(10);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(self.imgsView.mas_top).offset(@-10);
        }];
        
        [self.imgsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(self.contentL.mas_bottom).offset(10);
            make.bottom.equalTo(-10);
        }];
        
        self.didView = [UIView new];
        self.didView.backgroundColor = RGBColor(220, 220, 220);
        [self.contentView addSubview:self.didView];
        [self.didView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(0);
            make.height.equalTo(0.8);
            make.bottom.equalTo(-0.8);
        }];
    }
    return self;
}

- (void)setEntity:(CommentEntity *)entity{
    _entity = entity;
    [self.iconImg sd_setImageWithURL:[NSURL URLWithString:entity.iconName] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.phoneL.text = entity.name;
    self.timeL.text = entity.dateline;
    self.contentL.text = entity.content;
}

+ (CGFloat)goodsEvationHeight:(id)info{
    CommentEntity *entity = (CommentEntity*)info;
    CGFloat phoneHeight = 40;
    CGFloat margin = 10 + 10 + 10 + 5;
    CGFloat contentHeight = [CommentShopCell cellGoodsNameHeight:entity];
     return  phoneHeight  + contentHeight + margin;
}

//计算文本高度
+ (CGFloat)cellGoodsNameHeight:(CommentEntity*)entity{
    NSString *str = entity.content;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat nameHeight = [str sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(width, MAXFLOAT)].height;
    return nameHeight;
}


- (UILabel*)phoneL{
    if (!_phoneL) {
        _phoneL = [UILabel new];
        _phoneL.font = [UIFont systemFontOfSize:14];
        _phoneL.textColor =  RGBColor(120, 120, 120);
        _phoneL.textAlignment = NSTextAlignmentLeft;
    }
    return _phoneL;
}

- (UILabel*)timeL{
    if (!_timeL) {
        _timeL = [UILabel new];
        _timeL.font = [UIFont systemFontOfSize:12];
        _timeL.textColor =  RGBColor(150, 150, 150);
        _timeL.textAlignment = NSTextAlignmentLeft;
    }
    return _timeL;
}

- (UILabel*)contentL{
    if (!_contentL) {
        _contentL = [UILabel new];
        _contentL.font = ContentLabelFont;
        _contentL.textColor = RGBColor(81, 81, 81);
        _contentL.textAlignment = NSTextAlignmentLeft;
        _contentL.font = [UIFont systemFontOfSize:14];
        _contentL.numberOfLines = 0;
    }
    return _contentL;
}

- (UIImageView*)iconImg{
    if (!_iconImg) {
        _iconImg = [UIImageView new];
    }
    return _iconImg;
}

- (UIView *)imgsView{
    if (!_imgsView) {
        _imgsView = [UIView new];
    }
    return _imgsView;
}


@end


//
//  GAGoodsEvationCell.m
//  ManMao
//
//  Created by dym on 16/11/18.
//  Copyright © 2016年 Tuse. All rights reserved.
//

#import "GAGoodsEvationCell.h"
#import "GAGoodsEvaEntity.h"
#import "NSString+Helper.h"

#define  ContentLabelFont   [UIFont systemFontOfSize:14]

@interface GAGoodsEvationCell ()
@property (nonatomic,strong)UIImageView *iconImg;
@property (nonatomic,strong)UILabel *phoneL;
@property (nonatomic,strong)UILabel *timeL;
@property (nonatomic,strong)UILabel *contentL;
@property (nonatomic,strong)UIView *imgsView;

@property (nonatomic,strong)UIView *didView;
@end

@implementation GAGoodsEvationCell

+ (instancetype)GAGoodsEvationCellWithTableView:(UITableView*)tableView{
    static NSString *identifier = @"GAGoodsEvationCell";
    GAGoodsEvationCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[GAGoodsEvationCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

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
        
        
        [self.iconImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.top.equalTo(10);
            make.width.equalTo(40);
            make.height.equalTo(40);
        }];
        
        [self.phoneL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImg.right).offset(10);
            make.top.equalTo(10);
            make.right.offset(-10);
            make.height.equalTo(20);
        }];
        
        [self.timeL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImg.right).offset(10);
            make.top.equalTo(self.phoneL.bottom).offset(0);
            make.right.equalTo(-10);
            make.height.equalTo(20);
        }];
        
        [self.contentL mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.iconImg.bottom).offset(10);
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.bottom.equalTo(self.imgsView.top).offset(@-10);
        }];
    
        [self.imgsView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(10);
            make.right.equalTo(-10);
            make.top.equalTo(self.contentL.bottom).offset(10);
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
        
        
        UIButton *btn = [[UIButton alloc]init];
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(clickShop) forControlEvents:UIControlEventTouchDown];
        [self.contentView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.offset(0);
            make.height.equalTo(55);
        }];
    }
    return self;
}

- (void)loadCell{
    [self.iconImg sd_setImageWithURL:[NSURL URLWithString:self.entity.shop.shopIcom] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
    self.phoneL.attributedText = [NSString changeFontAddColor:[NSString stringWithFormat:@"店铺名称：%@",self.entity.shop.shopName] sonStr:self.entity.shop.shopName fontColor:RGBColor(36, 36, 36) font: [UIFont systemFontOfSize:15]];
    self.timeL.attributedText = [NSString changeFontAddColor:[NSString stringWithFormat:@"时间：%@",self.entity.sendTime] sonStr:@"时间：" fontColor: RGBColor(50, 50, 50) font: [UIFont systemFontOfSize:12]];
    
    self.contentL.text = self.entity.title;

    CGFloat contentHeight = [GAGoodsEvationCell cellGoodsNameHeight:self.entity];

    [self.contentL mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(contentHeight);
    }];

    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 50) / 3;
    CGFloat height = width;
    CGFloat margin = 10;
    
    [self.imgsView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0 ; i < self.entity.imgs.count; i++) {
        CGFloat X =(i * (width + margin));
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(X, 0, width, height)];
        [imgView sd_setImageWithURL:[NSURL URLWithString:self.entity.imgs[i]] placeholderImage:[UIImage imageNamed:@"zhanwei"]];
        imgView.tag = i;
        imgView.userInteractionEnabled = YES;
        [self.imgsView addSubview:imgView];
        
        imgView.layer.cornerRadius = 5;
        imgView.layer.masksToBounds = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickImgView:)];
        [imgView addGestureRecognizer:tap];
    }
    
}

- (void)clickImgView:(UITapGestureRecognizer*)tapView{
    UIView *view = tapView.view;
    if ([self.delegate respondsToSelector:@selector(clickGoodsEvationCellImgFrame:imgsURL:index:)]) {
        [self.delegate clickGoodsEvationCellImgFrame:[self.imgsView convertRect:view.frame toView:[UIApplication sharedApplication].keyWindow] imgsURL:self.entity.imgs index:tapView.view.tag];
    }
}

- (void)clickShop{
    [self.delegate clickShopView:self.entity];
}

+ (CGFloat)goodsEvationHeight:(id)info{
    GAGoodsEvaEntity *entity = (GAGoodsEvaEntity*)info;
    CGFloat phoneHeight = 40;
    CGFloat imgsheight = entity.imgs.count != 0 ? 70 * (SCREEN_WIDTH / 375)  : 0;
    CGFloat margin = entity.imgs.count != 0 ? (10 + 10 + 10 + 10 + 5) : (10 + 10 + 10 + 5);
    CGFloat contentHeight = [GAGoodsEvationCell cellGoodsNameHeight:entity];
    if (entity.imgs.count == 0) {
        return  phoneHeight + imgsheight + contentHeight + margin;
    }
    return phoneHeight + imgsheight + contentHeight + margin + 30;
}


//计算文本高度
+ (CGFloat)cellGoodsNameHeight:(GAGoodsEvaEntity*)entity{
    NSString *str = entity.title;
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 20;
    CGFloat nameHeight = [str sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake(width, MAXFLOAT)].height;
    return nameHeight;
}

- (UILabel*)phoneL{
    if (!_phoneL) {
        _phoneL = [UILabel new];
        _phoneL.font = [UIFont systemFontOfSize:15];
        _phoneL.textColor =  RGBColor(81, 81, 81);
        _phoneL.textAlignment = NSTextAlignmentLeft;
    }
    return _phoneL;
}

- (UILabel*)timeL{
    if (!_timeL) {
        _timeL = [UILabel new];
        _timeL.font = [UIFont systemFontOfSize:12];
        _timeL.textColor =  RGBColor(81, 81, 81);
//        _timeL.textColor = RGBColor(198, 198, 198);
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


- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
    
}



@end

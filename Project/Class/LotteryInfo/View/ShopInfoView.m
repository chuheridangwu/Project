//
//  ShopInfoView.m
//  Project
//
//  Created by dym on 2017/6/23.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "ShopInfoView.h"
#import "GAGoodsEvaEntity.h"

@interface ShopInfoView ()
@property (nonatomic, strong) UIView *backView;

@property (nonatomic, strong) UIImageView *iconimage;
@property (nonatomic, strong) UILabel *timeL;
@property (nonatomic, strong) UILabel *shopNameL;
@property (nonatomic, strong) UIView *listView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UIView *levelView;

@end

@implementation ShopInfoView

+ (instancetype)shareShopInfoView{
    static ShopInfoView *infoView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        infoView = [[ShopInfoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    });
    return infoView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];

        self.backView = [[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:self.backView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeShopInfoView)];
        [self.backView addGestureRecognizer:tap];
        
    }
    return self;
}



- (void)addSubViewShopInfo:(GAGoodsEvaEntity*)entity{
    
    [_contentView removeFromSuperview];
    _contentView = [[UIView alloc]initWithFrame:CGRectMake(30, 120,SCREEN_WIDTH - 60,300)];
    _contentView.layer.masksToBounds = YES;
    _contentView.layer.cornerRadius = 10;
    _contentView.backgroundColor = [UIColor whiteColor];
    _contentView.userInteractionEnabled = NO;
    [_backView addSubview:self.contentView];
    

    [_contentView addSubview:self.iconimage];
    
    CGFloat offsetY = _iconimage.mj_h + 20;
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, offsetY, 20, 20)];
    icon.image = [UIImage imageNamed:@"shopSelected"];
    icon.contentMode = UIViewContentModeScaleAspectFit;
    [_contentView addSubview:icon];
    
    self.shopNameL = [[UILabel alloc]initWithFrame:CGRectMake(icon.mj_w + 20, offsetY, _contentView.mj_w - icon.mj_w - 20, icon.mj_h)];
    [_contentView addSubview:self.shopNameL];
    
    offsetY += icon.mj_h + 10;
    UIImageView *icon1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, offsetY, 20, 20)];
    icon1.image = [UIImage imageNamed:@"oederSelected"];
    icon1.contentMode = UIViewContentModeScaleAspectFit;
    [_contentView addSubview:icon1];
    
    self.timeL = [[UILabel alloc]initWithFrame:CGRectMake(icon1.mj_w + 20, offsetY, _contentView.mj_w - icon1.mj_w - 20, icon1.mj_h)];
    [_contentView addSubview:self.timeL];
    
    offsetY += _timeL.mj_h + 10;
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(10, offsetY, 66, 20)];
    lable.text = @"店铺等级:";
    lable.font = [UIFont systemFontOfSize:14];
    [_contentView addSubview:lable];
    
    self.levelView = [[UIView alloc]initWithFrame:CGRectMake(lable.mj_w + 20, offsetY, _contentView.mj_w - lable.mj_w, lable.mj_h)];
    [_contentView addSubview:self.levelView];
    for (int i = 0; i < entity.shop.level; i++) {
        UIImageView *levImgView = [[UIImageView alloc]initWithFrame:CGRectMake((lable.mj_h + 6) * i, 0, lable.mj_h , lable.mj_h )];
        levImgView.image = [UIImage imageNamed:@"oederSelected"];
        [_levelView addSubview:levImgView];
    }
    
    offsetY += lable.mj_h + 10;
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, offsetY, _contentView.mj_w, 10)];
    [_contentView addSubview:lable1];
    lable1.text = @"店铺彩种:";
    lable1.font = [UIFont systemFontOfSize:14];
    
    
    
    
    
    
    [_iconimage sd_setImageWithURL:[NSURL URLWithString:entity.shop.shopIcom] placeholderImage:[UIImage imageNamed:@""]];
    _shopNameL.text = entity.shop.shopName;
    _timeL.text = [NSString stringWithFormat:@"营业时间: %@",entity.shop.time];
    
    
    
    
//    _listView.backgroundColor = [UIColor yellowColor];
//    _levelView.backgroundColor = [UIColor redColor];
//    _timeL.backgroundColor = [UIColor yellowColor];
//    _shopNameL.backgroundColor = [UIColor redColor];
//    _contentView.backgroundColor = [UIColor whiteColor];


}

- (void)showWithShopInfo:(GAGoodsEvaEntity*)entity{
    WS(ws);
    [[UIApplication sharedApplication].keyWindow addSubview:[ShopInfoView shareShopInfoView]];
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
    } completion:^(BOOL finished) {
        
    }];
    
    [self  addSubViewShopInfo:entity];
}


- (void)closeShopInfoView{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        
    }];
}


- (UIImageView*)iconimage{
    if (!_iconimage) {
        _iconimage = [[UIImageView alloc]initWithFrame:CGRectMake((_contentView.mj_w - 50) / 2, 10, 60,60)];
        _iconimage.layer.masksToBounds = YES;
        _iconimage.layer.cornerRadius = _iconimage.mj_w / 2;
    }
    return _iconimage;
}




@end

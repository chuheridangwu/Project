//
//  ShopInfoView.m
//  Project
//
//  Created by dym on 2017/6/23.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "ShopInfoView.h"
#import "GAGoodsEvaEntity.h"

@interface ShopInfoView ()<UIScrollViewDelegate>

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
        infoView = [[ShopInfoView alloc]init];
    });
    return infoView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    
    if (self = [super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)]) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        
        UIView *backView = [[UIView alloc]initWithFrame:self.bounds];
        [self addSubview:backView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeShopInfoView)];
        [backView addGestureRecognizer:tap];
        
        
        _contentView = [[UIView alloc]initWithFrame:CGRectMake(30, 120,SCREEN_WIDTH - 60,SCREEN_HEIGHT - 260)];
        _contentView.layer.masksToBounds = YES;
        _contentView.layer.cornerRadius = 10;
        _contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_contentView];
        
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:_contentView.bounds];
        [_contentView addSubview:imgView];
        
    }
    return self;
}



- (void)addSubViewShopInfo:(GAGoodsEvaEntity*)entity{
    [_contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    

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
        levImgView.image = [UIImage imageNamed:@"grade"];
        [_levelView addSubview:levImgView];
    }
    
    offsetY += lable.mj_h + 10;
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(10, offsetY, _contentView.mj_w, 10)];
    [_contentView addSubview:lable1];
    lable1.text = @"店铺彩种:";
    lable1.font = [UIFont systemFontOfSize:14];
    
    
    offsetY += lable1.mj_h + 10;
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, offsetY, _contentView.mj_w, _contentView.mj_h - offsetY)];
    [_contentView addSubview:scrollView];
    
    CGFloat margin = 5;
    NSInteger index = 4;
    CGFloat width = (_contentView.mj_w - margin * (index + 1)) / index;
    CGFloat height = width + 3;
    NSInteger count = arc4random()%(entity.shop.nameArray.count) >7 ? arc4random()%(entity.shop.nameArray.count) : 9;
    for (int i = 0; i < count; i++) {
        CGFloat row = i % index;
        CGFloat col = i / index;
        CGFloat x = row * (margin + width)+ margin;
        CGFloat y = col * (margin + height);
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(x, y, width, height)];
        [scrollView addSubview:btn];
        [btn setImage:[UIImage imageNamed:entity.shop.iconArray[i]] forState:UIControlStateNormal];
//        [btn setTitle:entity.shop.nameArray[i] forState:UIControlStateNormal];
//        [btn setTitleColor:XBAPPBaseColor forState:UIControlStateNormal];
//        btn.titleLabel.font = [UIFont systemFontOfSize:12];
        [btn buttonImageTitleAlignment:topImageBottomTitle WithSpace:0];

        [scrollView setContentSize:CGSizeMake(scrollView.mj_w,y + height + margin)];
    }
    
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
    _contentView.frame = CGRectMake((SCREEN_WIDTH - 10) / 2, (SCREEN_HEIGHT - 10) / 2, 10, 10);


    [[UIApplication sharedApplication].keyWindow addSubview:[ShopInfoView shareShopInfoView]];
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1;
        _contentView.frame = CGRectMake(30, 120,SCREEN_WIDTH - 60,SCREEN_HEIGHT - 260);
        [self addSubViewShopInfo:entity];

    } completion:^(BOOL finished) {
    }];
    
  
}


- (void)closeShopInfoView{
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _contentView.frame = CGRectMake((SCREEN_WIDTH - 10) / 2, (SCREEN_HEIGHT - 10) / 2, 10, 10);
    } completion:^(BOOL finished) {
        self.alpha = 0;
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

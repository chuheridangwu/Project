//
//  BuyLuckBallCell.m
//  Project
//
//  Created by dym on 2017/6/28.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "BuyLuckBallCell.h"
#import "HomeLuckBallEntity.h"

@interface BuyLuckBallCell ()
@property (nonatomic,strong)UIButton *selebtn;
@property (nonatomic,strong)UIView *backView;
@property (nonatomic,strong)UILabel *titleL;
@property (nonatomic,strong)NSMutableArray *btns;
@end

@implementation BuyLuckBallCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self  = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.mj_h = BuyLuckBallCellHeigth;
        _btns = [NSMutableArray array];
           }
    return self;
}

- (void)setEntity:(HomeLuckBallEntity *)entity{
    _entity = entity;
    
    [_backView removeFromSuperview];
    _backView = [[UIView alloc]initWithFrame:self.bounds];
    [self.contentView addSubview:_backView];
    
    self.titleL = [[UILabel alloc]initWithFrame:CGRectMake(0,8, 30, 15)];
    [_backView addSubview:self.titleL];
    _titleL.font = [UIFont systemFontOfSize:12];
//    _titleL.layer.masksToBounds = YES;
//    _titleL.layer.cornerRadius = 1;
    _titleL.backgroundColor = [UIColor grayColor];
    _titleL.textAlignment = NSTextAlignmentCenter;
    _titleL.textColor = [UIColor whiteColor];
    
    NSInteger count = 5;
    CGFloat btnWidth = 30;
    CGFloat max = _entity.min == 1 ? _entity.max : _entity.max + 1;
    
    CGFloat spaceMargin = (SCREEN_WIDTH - count * btnWidth) / (count + 1);
    for (int i = 0; i < max; i ++) {
        CGFloat row = i % count;
        CGFloat col = i / count;
        CGFloat X = spaceMargin + (spaceMargin + btnWidth) * row;
        CGFloat Y = 30 + (10 + btnWidth) * col;
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(X, Y, btnWidth, btnWidth)];
        btn.layer.cornerRadius = btnWidth / 2;
        btn.layer.masksToBounds = YES;
        btn.layer.borderWidth = 2;
        btn.layer.borderColor = XBAPPBaseColor.CGColor;
        NSString *title = [NSString stringWithFormat:@"%d", _entity.min == 1 ? i + 1 : i];
        [btn setTitle:title forState:UIControlStateNormal];
        [btn setTitleColor:XBAPPBaseColor forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        btn.tag = i;
        btn.titleLabel.font = [UIFont systemFontOfSize:14];
        [_backView addSubview:btn];
        [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
        
        [_btns addObject:btn];
    }
    
    
}
- (void)setTitleText:(NSString*)text withClickBtn:(NSString*)btnText{
    _titleL.text = text;
    
    for (UIButton *btn in _btns) {
        if ([btn.titleLabel.text isEqualToString:btnText]) {
            [self clickBtn:btn];
        }
    }
}

+ (CGFloat)cellheightWithInfo:(id)entity{
    HomeLuckBallEntity *entity1 = (HomeLuckBallEntity*)entity;
    CGFloat height;
//    CGFloat height =  ((entity1.max + 1) - entity1.min) % 5  == 0 ? BuyLuckBallCellHeigth : (BuyLuckBallCellHeigth + 40);
    if (entity1.max  > 10) {
        height = BuyLuckBallCellHeigth + 40;
    }else{
        height = BuyLuckBallCellHeigth;
    }
    return height;
}


- (void)clickBtn:(UIButton*)btn{
    [self.delegate clickBtnText:btn];
    _selebtn.backgroundColor = [UIColor whiteColor];
    _selebtn.selected = NO;
    
    btn.selected = YES;
    btn.backgroundColor = XBAPPBaseColor;
    
    _selebtn = btn;
   
}

@end

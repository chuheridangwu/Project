//
//  ProductView.m
//  Project
//
//  Created by 董玉毛 on 2017/7/2.
//  Copyright © 2017年 zzl. All rights reserved.
//

#import "ProductView.h"

#define ClickBtnH (60)


@interface ProductView ()
{
    UIView *_bottonView;
    NSArray *infoArr;
    
    NSMutableArray *_labelArray;
    NSMutableArray *_label1array;
    NSMutableArray *_btnArray;
}
@end

@implementation ProductView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _label1array = [NSMutableArray array];
        _labelArray = [NSMutableArray array];
        _btnArray = [NSMutableArray array];

    }
    return self;
}

- (void)setPrict:(NSArray *)priceArray withSaleArray:(NSArray *)saleArray{
    
    
    [_btnArray removeAllObjects];
    [_label1array removeAllObjects];
    [_labelArray removeAllObjects];
    
    [_bottonView removeFromSuperview];
    _bottonView = [[UIView alloc]initWithFrame:self.bounds];
    _bottonView.backgroundColor = [UIColor whiteColor];
    [self  addSubview:_bottonView];
    
    int row = 3;
    CGFloat margin = 8;
    CGFloat btnW = (self.width - margin * 4) / row;
    CGFloat btnH = ClickBtnH;
    for (int i = 0; i < priceArray.count; i++) {
        NSString *price = priceArray[i];
        NSString *sale = saleArray[i];
        
        
        CGFloat rowX = i % row;
        CGFloat colY = i / row;
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(margin + (rowX * (btnW + margin)), margin + (colY * (8 + btnH)), btnW, btnH);
        btn.tag = i;
        [btn setBorderRadian:10 width:1.0 color: XBAPPBaseColor];
        [btn addTarget:self action:@selector(clickCartBtn:) forControlEvents:UIControlEventTouchDown];
        
        CGFloat labelH = 20;
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0,10, btnW, labelH)];
        label.font = [UIFont systemFontOfSize:16];
        label.text = [NSString stringWithFormat:@"%@",price];
        label.textColor =  XBAPPBaseColor;
        label.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label];
        
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(label.frame), btnW,20)];
        label1.font = [UIFont systemFontOfSize:9];
        label1.text = [NSString stringWithFormat:@"售价:%@",sale];
        label1.textColor = [UIColor blackColor];
        label1.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:label1];
        
        [_bottonView addSubview:btn];
        [_labelArray addObject:label];
        [_label1array addObject:label1];
        [_btnArray addObject:btn];
        
        if (i == 0) {
            [self clickCartBtn:btn];
        }
    }
}


- (void)clickCartBtn:(UIButton*)btn{
    [self setLabelTitleColorWithTag:btn.tag];
    
    if (_delegate && [_delegate respondsToSelector:@selector(clickBtnCartInfoWithIndex:)]) {
        [_delegate clickBtnCartInfoWithIndex:btn.tag];
    }
}

- (void)setLabelTitleColorWithTag:(NSInteger)tag{
    for (UILabel *label in _labelArray) {
        label.textColor =  XBAPPBaseColor;
    }
    UILabel *label = _labelArray[tag];
    label.textColor = [UIColor whiteColor];
    
    for (UILabel *label in _label1array) {
        label.textColor = [UIColor blackColor];
    }
    UILabel *label1 = _label1array[tag];
    label1.textColor = [UIColor whiteColor];
    
    for (UIButton *btn in _btnArray) {
        btn.backgroundColor = [UIColor whiteColor];
    }
    
    UIButton *btn = _btnArray[tag];
    btn.backgroundColor =  XBAPPBaseColor;
}



@end

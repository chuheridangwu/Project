//
//  UserAttention.m
//  Beauty
//
//  Created by app on 15/12/16.
//  Copyright (c) 2015年 roderick. All rights reserved.
//

#import "UserAttention.h"

@interface UserAttention ()
@property (nonatomic,strong)NSMutableArray *backArr;
@property (nonatomic,strong)UIView *dicideView;
@end

@implementation UserAttention

- (UIView*)dicideView{
    if (!_dicideView) {
        _dicideView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 1, self.mj_h)];
        self.backgroundColor = [UIColor redColor];
    }
    return _dicideView;
}

- (NSMutableArray*)backArr{
    if (!_backArr) {
        _backArr = [NSMutableArray array];
    }
    return _backArr;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        
        NSArray *collectArr = @[@0,@0,@0];
        NSArray *attenArr = @[@"收藏的商品",@"关注的店铺",@"关注的发型师"];
        
        CGFloat backW = self.mj_w / 3;
        CGFloat backH = self.mj_h;
        for (int i = 0; i < 3; i++) {
            UIButton *back = [[UIButton alloc]init];
            CGFloat imageX = i *backW;
            back.frame = CGRectMake(imageX, 0, backW, backH);
            [back setTitle:attenArr[i] forState:UIControlStateNormal];
//            back.collect = [NSString stringWithFormat:@"%@",collectArr[i]];
            [self addSubview:back];
            
            UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBackImage:)];
            [back addGestureRecognizer:pan];
            pan.view.tag = i;
            
            
            CGFloat viewW = (i + 1) *backW;
            if (i == 0 || i == 1) {
                UIView *dicideView = [[UIView alloc]initWithFrame:CGRectMake(viewW, 0, 1, self.mj_h)];
                dicideView.backgroundColor = RGB_COLOR(114, 41, 111);
                [self addSubview:dicideView];
            }
            
           
        }
        
   }
    return self;
}

- (void)clickBackImage:(UITapGestureRecognizer*)pan{
    if (_delegate && [_delegate respondsToSelector:@selector(userAttentionClick:clickTag:)]) {
        [_delegate userAttentionClick:self clickTag:(int)pan.view.tag];
    }
}

@end

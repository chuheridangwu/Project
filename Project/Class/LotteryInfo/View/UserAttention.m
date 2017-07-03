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
        self.backgroundColor = XBAPPBaseColor;

        NSArray *attenArr = @[@"点赞",@"评论",@"分享"];
        NSArray *collectArr = @[@"encourage",@"comment",@"share"];
        CGFloat backW = SCREEN_WIDTH / 3;
        CGFloat backH = 40;
        for (int i = 0; i < 3; i++) {
            UIButton *back = [[UIButton alloc]init];
            CGFloat imageX = i *backW;
            back.frame = CGRectMake(imageX, 0, backW, backH);
            [back setTitle:attenArr[i] forState:UIControlStateNormal];
            [back setImage:[UIImage imageNamed:collectArr[i]] forState:UIControlStateNormal];
            [self addSubview:back];
            back.titleLabel.font = [UIFont systemFontOfSize:14];
            back.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 5);
            
            UITapGestureRecognizer *pan = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickBackImage:)];
            [back addGestureRecognizer:pan];
            pan.view.tag = i;
            
            
            CGFloat viewW = (i + 1) *backW;
            if (i == 0 || i == 1) {
                UIView *dicideView = [[UIView alloc]initWithFrame:CGRectMake(viewW, 0, 1,40)];
                dicideView.backgroundColor = [UIColor whiteColor];
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

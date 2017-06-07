//
//  ContentView.m
//  LittleGame
//
//  Created by dym on 16/11/7.
//  Copyright © 2016年 wewq. All rights reserved.
//

#import "BottonView.h"
#import "HeardView.h"
#import "ContentView.h"
#import "DidView.h"

#define XB_ScreenSize  [UIScreen mainScreen].bounds.size

@interface BottonView ()<ContentViewDelegate>
@property (nonatomic,strong)NSArray *bgArray;
@property (nonatomic,strong)HeardView *heardView;
@property (nonatomic,strong)ContentView *ctnView;
@property (nonatomic,strong)DidView *didView;

@property (nonatomic,assign)int index;
@property (nonatomic,weak)NSTimer *timer;
@end

@implementation BottonView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *bgImg = [[UIImageView alloc]initWithFrame:CGRectZero];
        bgImg.userInteractionEnabled = YES;
        NSInteger count = arc4random() % self.bgArray.count;
        bgImg.image = [UIImage imageNamed:self.bgArray[count]];
        [self addSubview:bgImg];
        [bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).insets(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        
        [bgImg addSubview:self.heardView];
        [self.heardView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(30);
            make.top.equalTo(60);
            make.right.equalTo(-30);
            make.height.equalTo(60);
        }];
       

        [bgImg addSubview:self.ctnView];
        [self.ctnView setBgImg:[UIImage imageNamed:[self colorArray][count]]];
        [self.ctnView setCententVackImg:[UIImage imageNamed:[self cententBgColor][count]]];
        
        [bgImg addSubview:self.didView];
        
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(downTime:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        self.index = 60;
        [self.heardView setHeardViewTime:[NSString stringWithFormat:@"%d",self.index]];
    }
    return self;
}

- (void)downTime:(NSTimer*)timer{
    self.index --;
    if (self.index <= 0 ) {
         [self userFailure];
        return;
    }
    
    [self.heardView setHeardViewTime:[NSString stringWithFormat:@"%d",self.index]];
}

- (void)clickErrorMessage{
    [self.didView didViewReductionLiveImg];
    
    [self determineWhetherReload];
}

//判断是否调用代理
- (void)determineWhetherReload{
    static int i = 0;
    i++;
    if (i == 4) {
        i = 0;
        [self userFailure];
    }
}

- (void)userFailure{
    //清除倒计时
    [self bottonDestructionCountdown];
    
    if ([self.delegate respondsToSelector:@selector(clickContentViewErrorMessage:)]) {
        [self.delegate clickContentViewErrorMessage:[NSString stringWithFormat:@"%02d",60 - self.index == 0 ? 60 : 60 - self.index]];
    }
}

- (void)successfulCustomsClearance{
    //清除倒计时
    [self bottonDestructionCountdown];
    
    if ([self.delegate respondsToSelector:@selector(clickContentSuccessfulCustomsClearance:)]) {
        [self.delegate clickContentSuccessfulCustomsClearance:[NSString stringWithFormat:@"%02d",60 - self.index == 0 ? 60 : 60 - self.index]];
    }
}

- (void)bottonDestructionCountdown{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark  ---- lazy

- (NSArray*)bgArray{
    if (!_bgArray) {
        _bgArray = @[@"bg_level_blue.png",@"bg_level_green.png",@"bg_level_purple.png",@"bg_level_red.png",@"bg_level_yellow"];
    }
    return _bgArray;
}

- (NSArray*)colorArray{
    return @[@"pc_panel_blue",@"pc_panel_green",@"pc_panel_purple",@"pc_panel_red",@"pc_panel_yellow"];
}

- (NSArray*)cententBgColor{
    return @[@"bg_panel_blue",@"bg_panel_green",@"bg_panel_purple",@"bg_panel_red",@"bg_panel_yellow"];
}

- (HeardView*)heardView{
    if (!_heardView) {
        _heardView = [HeardView new];
    }
    return _heardView;
}

- (ContentView*)ctnView{
    if (!_ctnView) {
        CGFloat ctnX = (18 / XB_ScreenSize.width) * 375;
        CGFloat ctnY = (110 / XB_ScreenSize.height) * 667;
        _ctnView = [[ContentView alloc]initWithFrame:CGRectMake( ctnX, ctnY, XB_ScreenSize.width - ctnX * 2, XB_ScreenSize.width - ctnX * 2)];
        _ctnView.delegate = self;
    }
    return _ctnView;
}

- (DidView*)didView{
    if (!_didView) {
        _didView = [[DidView alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(self.ctnView.frame) + 20, XB_ScreenSize.width - 60, 40)];
    }
    return _didView;
}

@end
